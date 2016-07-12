//
//  UploadImageApi.h
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/13.
//  Copyright © 2016年 etong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"
/**
 2 上传图片api
 */
@interface UploadImageApi : YTKRequest

- (id)initWithImage:(UIImage *)image;

@end
