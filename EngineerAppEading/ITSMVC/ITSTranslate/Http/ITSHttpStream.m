//
//  HttpManager.m
//  tfsp_rc
//
//  Created by Xukj on 3/25/13.
//
//

#import "ITSHttpStream.h"
#import "ITSRequest.h"
#import "ITSResponse.h"
#import "ITS.h"

#import "MKNetworkKit.h"
#import "MKNetworkOperationExt.h"

#import "BaseRequest.h"
#import "BaseResponse.h"

#define kStream_Cache_RequestBean_Tag @"kStream_Cache_RequestBean_Tag"
#define kStream_Cache_Response_Data @"kStream_Cache_Response_Data"

@implementation ITSHttpStream

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - life cycle

///////////////////////////////////////////////////////////////////////////////////////////////////

-(id)init
{
    self = [super init];
    
    if (self) {
        //TODO
        netEngine = [[MKNetworkEngine alloc] init];
    }
    
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Private API delegate

///////////////////////////////////////////////////////////////////////////////////////////////////

-(NSURL *)actionURL:(NSString *)requestCommand
{
    hostUrl = @"";
    // 如果没有设置hostname，那么直接把requestCommand当做请求url发送
    if (_hostname) {
        hostUrl = _hostname;
    }
    else {
        hostUrl = requestCommand;
        
        DDLogVerbose(@"%@", hostUrl);
        
        return [NSURL URLWithString:hostUrl];
    }
    
    if (_port) {
        hostUrl = [hostUrl stringByAppendingFormat:@":%@", _port];
    }
    
    hostUrl = [hostUrl stringByAppendingFormat:@"/%@", requestCommand];
        
    return [NSURL URLWithString:hostUrl];
}

-(void)request:(MKNetworkOperation *)opt parse:(NSData *)data requestBeanTag:(NSUInteger)requestBeanTag
{
    // 通过工厂方法，找到匹配的解析方案
    id object = [ITSResponse decode:data tag:[NSNumber numberWithUnsignedInt:requestBeanTag]];
    
    [self request:opt didReceiveObject:object];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Public API delegate

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)sendHttpRequest:(BaseRequest *)request requestInfo:(NSDictionary *)requestInfo
{
    dispatch_block_t block = ^{@autoreleasepool{
    
        switch (request.requestType) {
            case HttpRequestTypeGet:
                [self sendGetHttpRequest:request requestInfo:requestInfo];
                break;
            case HttpRequestTypePost:
                //由于还未验证POST，因此暂不支持POST请求
//                [self sendPostHttpRequest:requestInfo userinfo:userinfo];
                break;
            case HttpRequestTypePostWithFile:
            case HttpRequestTypePostWithData:
                
                //文件传输暂时未支持
                
                break;
            default:
                break;
        }
    }};
    
    [self schedule:block];
}

/**
 *	@brief	http get请求
 *
 *	@param 	requestInfo 	实现接口ITSRequestDelegate的实体类
 */
-(void)sendGetHttpRequest:(BaseRequest *)request
              requestInfo:(NSDictionary *)requestInfo
{
    dispatch_block_t block = ^{@autoreleasepool{
        
        DDLogVerbose(@"%@(%@)", THIS_FILE, THIS_METHOD);
        
        // 本地实体对象编码为服务器能够识别的数据
        NSString *requestCommand = [request encode];
        
        if (requestCommand == nil)
            return;
        
        NSURL *url = [self actionURL:requestCommand];
        
        MKNetworkOperationExt *operationExt = [[MKNetworkOperationExt alloc] initWithURLString:[url absoluteString] params:nil httpMethod:@"GET"];
        // 缓存需要的信息
        operationExt.requestinfo = requestInfo;
        operationExt.userinfo = request.userinfo;
        // 请求tag
        operationExt.tag = request.tag;
        // MKNetworkOperation *operation = [self.netEngine operationWithPath:url];
        
        MKNKResponseBlock responseBlock = ^(MKNetworkOperation *operation) {
            [self requestFinished:operation];
        };
        
        MKNKResponseErrorBlock errorBlock = ^(MKNetworkOperation *operation, NSError *error) {
            [self requestFailed:operation error:error];
        };
        
        [operationExt addCompletionHandler:responseBlock errorHandler:errorBlock];
        
        [self requestStarted:operationExt];
        
        // 如果请求失败，重新请求
        [netEngine enqueueOperation:operationExt forceReload:YES];
    }};
    
    [self schedule:block];
}

-(void)sendPostHttpRequest:(BaseRequest *)requestInfo
                  userinfo:(NSDictionary *)userinfo
{
    dispatch_block_t block = ^{@autoreleasepool{
        
        DDLogVerbose(@"%@(%@)", THIS_FILE, THIS_METHOD);
        
        // 本地实体对象编码为服务器能够识别的数据
        NSDictionary *requestParam = [requestInfo encode];
        
        NSURL *url = [self actionURL:requestInfo.requestCommand];
        
        MKNetworkOperationExt *operationExt = [[MKNetworkOperationExt alloc] initWithURLString:[url absoluteString] params:requestParam httpMethod:@"POST"];
        // 缓存需要的信息
        operationExt.userinfo = userinfo;
        // 请求tag
        operationExt.tag = requestInfo.tag;
        // MKNetworkOperation *operation = [self.netEngine operationWithPath:url];
        
        MKNKResponseBlock responseBlock = ^(MKNetworkOperation *operation) {
            [self requestFinished:operation];
        };
        
        MKNKResponseErrorBlock errorBlock = ^(MKNetworkOperation *operation, NSError *error) {
            [self requestFailed:operation error:error];
        };
        
        [operationExt addCompletionHandler:responseBlock errorHandler:errorBlock];
        
        [self requestStarted:operationExt];
        
        // 如果请求失败，重新请求
        [netEngine enqueueOperation:operationExt forceReload:YES];
        
    }};
    
    [self schedule:block];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Http请求以及应答，在各个状态下的回调

///////////////////////////////////////////////////////////////////////////////////////////////////

-(void)request:(MKNetworkOperation *)opt didReceiveData:(NSData *)data
{
    DDLogVerbose(@"%@(%@)", THIS_FILE, THIS_METHOD);
    
    //不作任何处理
}

- (void)requestStarted:(MKNetworkOperation *)opt
{
    DDLogVerbose(@"%@(%@)", THIS_FILE, THIS_METHOD);
    
    [gcdMulticastDelegate performSelector:@selector(requestStarted:) withObject:opt];
}

- (void)requestFinished:(MKNetworkOperation *)opt
{
    DDLogVerbose(@"%@(%@)", THIS_FILE, THIS_METHOD);
    
    dispatch_block_t block = ^{@autoreleasepool{
        
        DDLogVerbose(@"%@", [opt responseString]);
        
        //接收到数据后，完成解析操作。解析操作均在解析线程中执行
        MKNetworkOperationExt *optExt = (MKNetworkOperationExt *)opt;
        [self request:optExt parse:[optExt responseData] requestBeanTag:optExt.tag];        
    }};

//    if (dispatch_get_current_queue() == parseQueue)
//        block();
//    else
        dispatch_sync(parseQueue, block);
    
    [gcdMulticastDelegate performSelector:@selector(requestFinished:) withObject:opt];
}

- (void)requestFailed:(MKNetworkOperation *)opt error:(NSError *)error
{
    DDLogVerbose(@"%@(%@)", THIS_FILE, THIS_METHOD);
    DDLogVerbose(@"%@", error);
    
    [gcdMulticastDelegate performSelector:@selector(requestFailed::) withObject:opt withObject:error];
}

// 通过插件管理对象，调用插件中实现的方法
-(void)request:(MKNetworkOperation *)opt didReceiveObject:(id)object
{
    // 该方法在dataStreamQueue中执行
    dispatch_block_t block = ^{
        
        ((BaseResponse *)object).userinfo = ((MKNetworkOperationExt *)opt).userinfo;
        DDLogVerbose(@"%@(%@)tag:%d", THIS_FILE, THIS_METHOD, [(id<ITSResponseDelegate>)object tag]);
        
        // multicastDelgate没有实现该方法，所以在其内部，会把该函数调用消息传递给其保存的delegate中去执行。
        [gcdMulticastDelegate performSelector:@selector(request:didReceiveObject:) withObject:opt withObject:object];

    };
    
    // 在dataStreamQueue线程中执行，提交给上层逻辑处理。
    // 上层处理时，需要到对应的线程中执行
    [self execute:block];
}

@end
