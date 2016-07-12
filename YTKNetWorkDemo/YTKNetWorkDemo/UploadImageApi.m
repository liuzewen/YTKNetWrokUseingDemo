//
//  UploadImageApi.m
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/13.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "UploadImageApi.h"
#import "UtilMacro.h"

@implementation UploadImageApi {
    UIImage *_image;
}

- (id)initWithImage:(UIImage *)image{
    self = [super init];
    if (self) {
        _image = image;
    }
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

/// 请求的BaseURL
- (NSString *)baseUrl {
    return imageuploadurl;
}

- (NSString *)requestUrl {
    return requestimage;
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}
//覆盖该方法上传图片
- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
//        压之前进行缩的处理
        NSData *data = UIImageJPEGRepresentation(_image, 0.9);//压
        NSString *name = @"imagename";
        NSString *formKey = @"image";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:data name:formKey fileName:name mimeType:type];
    };
}
//断点续传
- (NSString *)resumableDownloadPath {
    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *cachePath = [libPath stringByAppendingPathComponent:@"imageCaches"];
    NSString *filePath = [cachePath stringByAppendingPathComponent:  [NSString stringWithFormat:@"%@",_image]];
    return filePath;
}
//image 缩
- (UIImage*)scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //判断是否为retina屏
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    // 绘制改变大小的图片
    [_image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
@end
