//
//  PATLoopViewCell.m
//  pictureViewer
//
//  Created by PatrickY on 2017/11/20.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "PATLoopViewCell.h"

@implementation PATLoopViewCell{
    UIImageView *_imageview;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        //添加图像
        _imageview = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:_imageview];
        
    }
    
    return self;
    
}

- (void)setUrl:(NSURL *)url {
    
    _url = url;
    //2进制转换
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    _imageview.image = image;
    
}

@end
