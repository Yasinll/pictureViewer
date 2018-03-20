//
//  PATLoopViewLayout.m
//  pictureViewer
//
//  Created by PatrickY on 2017/11/20.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "PATLoopViewLayout.h"

@implementation PATLoopViewLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;

}

@end
