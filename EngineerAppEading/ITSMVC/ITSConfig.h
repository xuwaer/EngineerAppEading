//
//  TranslateConfig.h
//  tfsp_rc
//
//  Created by Xukj on 3/25/13.
//
//

#import "ITSRequest.h"
#import "ITSResponse.h"

#ifndef tfsp_rc_TranslateConfig_h
#define tfsp_rc_TranslateConfig_h

//////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - request type

//////////////////////////////////////////////////////////////////////////////////////////////////

// 只能选择其中一个，其他的请注释掉

//#ifndef request_datatype_json
//#define request_datatype_json
//#endif 
//
//#ifndef request_datatype_xml
//#define request_datatype_xml
//#endif
//
//#ifndef request_datatype_data
//#define request_datatype_data
//#endif

#ifndef request_datatype_url
#define request_datatype_url
#endif

//#ifndef request_datatype_other
//#define request_datatype_other
//#endif

//////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - response type

//////////////////////////////////////////////////////////////////////////////////////////////////

/*
 *  只能选择一个，其他的请注释掉
 */

#ifndef response_datatype_json
#define response_datatype_json
#endif

//#ifndef response_datatype_xml
//#define response_datatype_xml
//#endif
//
//#ifndef response_datatype_data
//#define response_datatype_data
//#endif
//
//#ifndef response_datatype_other
//#define response_datatype_other
//#endif

//////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - response type

//////////////////////////////////////////////////////////////////////////////////////////////////

/*
 *  只能选择一个，其他的请注释掉
 */

//#ifndef connectiontype_socket
//#define connectiontype_socket
//#endif

#ifndef connectiontype_http
#define connectiontype_http
#endif

//#ifndef connectiontype_other
//#define connectiontype_other
//#endif

//////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 实体类标志符

//////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef kActionCommand
#define kActionCommand_Query    @"query"        //查询请求
#endif

#ifndef kActionTag
#define kActionTag_Request_Query    1000        //地震查询

#define kActionTag_Response_Query   kActionTag_Request_Query
#endif

// 服务器连接方式
#ifdef connectiontype_socket

#elif defined (connectiontype_http)
#import "ITSHttpStream.h"
#import "ITSHttpQueueModule.h"
#elif defined (connectiontype_other)

#endif

#define HTTP_REQUEST_TIMEOUT 10

#endif
