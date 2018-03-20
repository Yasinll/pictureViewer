//
//  PATLoopview.m
//  pictureViewer
//
//  Created by PatrickY on 2017/11/20.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "PATLoopview.h"
#import "PATLoopViewLayout.h"
#import "PATLoopViewCell.h"

NSString *const PATLoopviewCellID = @"PATLoopviewCellID";

@interface PATLoopview() <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation PATLoopview{
    NSArray<NSURL *> *_urls;    
}

//布局
- (instancetype)initWithUrls:(NSArray<NSURL *> *)urls {
    
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[PATLoopViewLayout alloc] init]];
    
            if (self){
                
                _urls = urls;
                
                self.delegate = self;
                self.dataSource = self;
                
                [self registerClass:[PATLoopViewCell class] forCellWithReuseIdentifier:PATLoopviewCellID];
                
                //初始显示第2组
                //主队列异步 先执行数据源
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_urls.count inSection:0];
                    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
                    
                });
            }
    
    return self;
    
}


#pragma mark UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    //返回数据源放大 防止卡顿
    return _urls.count * 100;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PATLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PATLoopviewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    cell.url = _urls[indexPath.item % _urls.count];
    
    return cell;
    
}

#pragma mark UICollectionViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //当前停止页面
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //最后一页跳转到上一组最后一页 第一页跳转到下一组第一页
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1) {
        
        if (offset == 0) {
            offset = _urls.count;
        } else {
            offset = _urls.count - 1;
        }
        
        // 调整contentOffset
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}

@end
