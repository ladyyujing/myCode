//
//  MyCollectionViewCell.m
//  UICollectionView
//
//  Created by mac on 16/3/14.
//  Copyright © 2016年 movga. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 70, 70)];
        _topImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_topImage];
    }
   // _topImage.layer.masksToBounds = NO;
    _topImage.layer.cornerRadius = _topImage.frame.size.height / 2 ;
    _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
    _botlabel.textAlignment = NSTextAlignmentCenter;
    _botlabel.textColor = [UIColor blueColor];
    _botlabel.font =  [UIFont systemFontOfSize:15];
    _botlabel.backgroundColor = [UIColor purpleColor];
    
    [self.contentView addSubview:_botlabel];
    return self;
}
@end
