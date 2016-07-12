//
//  FacuityListApi.m
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/8.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "FacuityListApi.h"
#import "UtilMacro.h"

@implementation FacuityListApi{
    NSString *_collegeId;
}

- (id)initWithCollegeId:(NSString *)collegeId {
    self = [super init];
    if (self) {
        _collegeId=collegeId;
    }
    return self;
}

- (NSString *)requestUrl {
    return facultylist;
}

- (id)requestArgument {
    return @{@"college_id":_collegeId};
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPost;
}

- (NSInteger)cacheTimeInSeconds {
    return 60*30;
}
@end
