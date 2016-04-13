//
//  ViewController.m
//  UICollectionView
//
//  Created by mac on 16/3/14.
//  Copyright © 2016年 movga. All rights reserved.
//888

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "LFCircleLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView *mainCollectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化layout
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    LFCircleLayout *layout = [[LFCircleLayout alloc] init];
//    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    layout.headerReferenceSize = CGSizeMake(0, 20);
//    layout.itemSize = CGSizeMake(110, 150);
    
    mainCollectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
    //CGRect frame = self.view.bounds;
    NSLog(@"centerX:%fcenterY:%f",mainCollectionView.center.x,mainCollectionView.center.y);
    [self.view addSubview:mainCollectionView];
    mainCollectionView.backgroundColor = [UIColor clearColor];
    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
  //  [mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    //cosf(30); M_PI
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    view.backgroundColor = [UIColor yellowColor];
    view.center = self.view.center;
    [self.view addSubview:view];
    
}

#pragma mark collectionView delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}


//设置每个item的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(90, 130);
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    NSLog(@"cell,center:%f, %f ",cell.center.x,cell.center.y);
    
    cell.botlabel.text = [NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}

//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(0, 10);
//}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
//
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 10;
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 15;
//}
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
//    headerView.backgroundColor = [UIColor grayColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
//    label.text = @"这是collectionView的头部";
//    label.font = [UIFont systemFontOfSize:20];
//    [headerView addSubview:label];
//    return headerView;
//}
//
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.botlabel.text;
    NSLog(@"%@ center:%ld",msg,(long)cell.center.x);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
