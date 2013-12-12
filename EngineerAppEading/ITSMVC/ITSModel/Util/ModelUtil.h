//
//  ModelUtil.h
//  tfsp_rc
//
//  Created by Xukj on 3/25/13.
//
//

#import <Foundation/Foundation.h>

@interface ModelUtil : NSObject

+(id)convertObjectToJSON:(id)object DEPRECATED_ATTRIBUTE;

+(id)convertObjectToXML:(id)object DEPRECATED_ATTRIBUTE;

/**
 *	@brief	时间制式转换为UTC字符串
 *
 *	@param 	date 	时间NSDate
 *
 *	@return	UTC字符串
 */
+(NSString *)convertDateToUTCType1:(NSDate *)date;
+(NSString *)convertDateToUTCType2:(NSDate *)date;

/**
 *	@brief	生成颜色参数
 *
 *	@param 	alert
 *
 *	@return
 */
+(UIColor *)convertAlertToColor:(NSString *)alert;

+(NSString *)formatDepthData:(float)depth;

@end
