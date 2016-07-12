//
//  FacuityListApi.h
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/8.
//  Copyright © 2016年 etong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"
/**
 *  2.	获取学校院系列表
 */
@interface FacuityListApi : YTKRequest

- (id)initWithCollegeId:(NSString *)collegeId;

@end
