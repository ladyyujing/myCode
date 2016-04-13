//
//  LFCircleLayout.m
//  UICollectionView
//
//  Created by mac on 16/3/14.
//  Copyright © 2016年 movga. All rights reserved.
//

#import "LFCircleLayout.h"
#define kCalcAngle(x) x * M_PI / 180.0

@implementation LFCircleLayout
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = 8;
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSInteger index = indexPath.item;
    CGFloat radius = 130;
    CGFloat circleX = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat circleY = [UIScreen mainScreen].bounds.size.height * 0.5;
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    CGFloat singleItemAngle = 360.0 / count;
    CGFloat x = radius * cosf(kCalcAngle(singleItemAngle * index));
    CGFloat y = radius * sinf(kCalcAngle(singleItemAngle * index));
    attrs.size = CGSizeMake(90, 130);
    attrs.center = CGPointMake(circleX  + x, circleY  - y);
    return attrs;
}
@end
