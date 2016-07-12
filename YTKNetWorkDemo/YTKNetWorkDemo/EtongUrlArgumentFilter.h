//
//  EtongUrlArgumentFilter.h
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/6.
//  Copyright © 2016年 etong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKBaseRequest.h"
#import "YTKNetworkConfig.h"
/**
 *   给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
 */
@interface EtongUrlArgumentFilter : NSObject<YTKUrlFilterProtocol>

+ (EtongUrlArgumentFilter *) filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;
@end
