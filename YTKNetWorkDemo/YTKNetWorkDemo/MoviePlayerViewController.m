//
//  MoviePlayerViewController.m
//  YTKNetWorkDemo
//
//  Created by liuzewen on 16/6/20.
//  Copyright © 2016年 etong. All rights reserved.
//

#import "MoviePlayerViewController.h"
#import "ZFPlayerView.h"
#import "Masonry.h"

@interface MoviePlayerViewController ()

@property (strong,nonatomic) ZFPlayerView *playerView;

@end

@implementation MoviePlayerViewController

- (void)viewDidLoad {
      [super viewDidLoad];
      [self testZFPlayerDemo];
}

- (void)testZFPlayerDemo{
    _playerView = [[ZFPlayerView alloc] init];
    [self.view addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view);
        // 注意此处，宽高比16：9优先级比1000低就行，在因为iPhone 4S宽高比不是16：9
        make.height.equalTo(self.playerView.mas_width).multipliedBy(9.0f/16.0f).with.priority(750);
    }];
    self.playerView.videoURL = [NSURL URLWithString:@"http://baobab.wdjcdn.com/14525705791193.mp4"];
    __weak typeof(self) weakSelf = self;
    self.playerView.goBackBlock = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
