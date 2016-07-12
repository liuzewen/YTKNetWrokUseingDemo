//
//  ViewController.m
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/2.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "ViewController.h"
#import "CollegesListApi.h"
#import "YTKChainRequest.h"
#import "FacuityListApi.h"
#import "UploadImageApi.h"
@interface ViewController ()<YTKChainRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testUploadImage];
   //[self testCollagesListApi];
    //[self testChainRequest];
  
}
//调用CollegesLisApi
- (void)testCollagesListApi {
    CollegesListApi *collegesListApi = [[CollegesListApi alloc]init];
    __block NSDictionary *json;
//    显示上次缓存的内容
    if([collegesListApi cacheJson]){
        json =[collegesListApi cacheJson];
        NSArray *data=json[@"data"][@"colleges"];
        NSLog(@"%@",data[0]);
        NSLog(@"%@",data[0][@"college_id"]);
        NSLog(@"data from cache");
    }
    [collegesListApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            json = request.responseJSONObject;
            NSArray *data=json[@"data"][@"colleges"];
            NSLog(@"%@",data[0]);
            NSLog(@"%@",data[0][@"college_id"]);
            NSLog(@"data from request");
            NSLog(@"update UI");
        } failure:^(__kindof YTKBaseRequest *request) {
            NSLog(@"failed");
    }];

}
//管理有相互依赖的网络请求
- (void)testChainRequest {
    CollegesListApi *collegesListApi = [[CollegesListApi alloc]init];
    YTKChainRequest *chainReq = [[YTKChainRequest alloc]init];
    [chainReq addRequest:collegesListApi callback:^(YTKChainRequest *chainRequest, YTKBaseRequest *baseRequest) {
        CollegesListApi *result = (CollegesListApi *)baseRequest;
        NSString *college_Id =  [result getCollegesId];
        FacuityListApi *facuityListApi = [[FacuityListApi alloc]initWithCollegeId:college_Id];
        [chainRequest addRequest:facuityListApi callback:nil];
    }];
    chainReq.delegate = self;
    [chainReq start];
}

- (void)chainRequestFinished:(YTKChainRequest *)chainRequest {
    FacuityListApi *result = [chainRequest requestArray][1];
    NSDictionary *dic = result.responseJSONObject;
    NSArray *data=dic[@"data"][@"facultys"];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"faculty is %@",data[idx][@"faculty_name"]);
    }];
}

- (void)chainRequestFailed:(YTKChainRequest *)chainRequest failedBaseRequest:(YTKBaseRequest*)request {
    NSLog(@"fail");
}

// 测试上传图片
- (void)testUploadImage {
    UIImage *image = [UIImage imageNamed:@"sideba_userFeedback"];
    UploadImageApi *uploadImageApi = [[UploadImageApi alloc]initWithImage:image];
    [uploadImageApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        //NSString *result = request.responseString;
        NSDictionary *dic = request.responseJSONObject;
        NSString *url = dic[@"files"][0][@"url"];
        NSLog(@"url is %@",url);
        NSLog(@"image upload success");
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"image upload fail");
    }];
}

@end
