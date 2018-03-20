//
//  ViewController.m
//  pictureViewer
//
//  Created by PatrickY on 2017/11/20.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "PATLoopview.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray <NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadData];
    
    //创建界面
    PATLoopview *loopView = [[PATLoopview alloc] initWithUrls:_urls];
    loopView.frame = CGRectMake(20, 200, self.view.bounds.size.width - 40, 400);
    
    [self.view addSubview:loopView];
    
}

-(void)loadData {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        
        NSString *imageName = [NSString stringWithFormat: @"%02zd.jpg", (i+1)];
        NSURL *url = [[NSBundle mainBundle] URLForResource:imageName withExtension:nil] ;
        
        [arrayM addObject:url];
        
    }
    
    _urls = arrayM.copy;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
