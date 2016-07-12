//
//  CollegesListApi.m
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/2.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "CollegesListApi.h"
#import "UtilMacro.h"

@implementation CollegesListApi
//请求url
- (NSString *)requestUrl {
    return collegeslist;
}
//请求方法指定
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
//返回数据验证
- (id)jsonValidator{
    return @{@"message":[NSString class],
             @"data":@{@"colleges":@[[NSDictionary class]]},
             @"toast":[NSString class],
             @"code":[NSNumber class]};
}
//按时间缓存内容
- (NSInteger)cacheTimeInSeconds{
    //30 分钟＝1800s
    return 60*30;
}

- (NSString *)getCollegesId {
    return [self responseJSONObject][@"data"][@"colleges"][0][@"college_id"];
}
@end
