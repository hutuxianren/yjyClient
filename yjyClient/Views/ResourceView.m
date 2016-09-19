//
//  ResourceView.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/27.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//  文件 资源 pdf等

#import "ResourceView.h"
#import "Masonry.h"
@implementation ResourceView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    webView=[UIWebView new];
    
    [self addSubview:webView];
        //webView.frame=CGRectMake(0, 0, 300, 300);
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
    NSString*path =[[NSBundle mainBundle] pathForResource:@"docker" ofType:@"pptx"];
    NSURL *targetURL =[NSURL fileURLWithPath:path];
    NSURLRequest*request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://112.74.68.121:8010/"]];
    [webView loadRequest:request];
    //webView.delegate = self;
    webView.multipleTouchEnabled = YES;
    webView.scalesPageToFit = YES;

}

@end
