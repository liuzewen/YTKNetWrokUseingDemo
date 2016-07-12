//
//  EtongUrlArgumentFilter.m
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/6.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "EtongUrlArgumentFilter.h"
#import "YTKNetworkPrivate.h"

@implementation EtongUrlArgumentFilter{
    NSDictionary *_arguments;
}

+ (EtongUrlArgumentFilter *) filterWithArguments:(NSDictionary *)arguments{
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments{
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    return [YTKNetworkPrivate urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
}
@end
