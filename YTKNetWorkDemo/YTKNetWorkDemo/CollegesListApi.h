//
//  CollegesListApi.h
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/2.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "YTKRequest.h"
/**
 *  1.	获取所有学校列表
 */
@interface CollegesListApi : YTKRequest

- (NSString *)getCollegesId;
@end
