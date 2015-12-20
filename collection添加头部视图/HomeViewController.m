//
//  HomeViewController.m
//  collection添加头部视图
//
//  Created by Eclectic on 15/12/20.
//  Copyright © 2015年 Eclectic. All rights reserved.
//


#import "HomeViewController.h"
#import "CustomCollectionViewCell.h"

static NSString *headerViewIdentifier = @"hederview";

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UIImageView *headerImage;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加collectionview
    [self addCollectionView];
    
}

-(void)addCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing=20; //设置每一行的间距
    layout.itemSize=CGSizeMake(100, 100);  //设置每个单元格的大小
    layout.sectionInset=UIEdgeInsetsMake(0, 0, 50, 0);
    layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 200); //设置collectionView头视图的大小
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.frame=self.view.bounds;
    //注册cell单元格
    [collectionView registerNib:[UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    //注册头视图
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    
    collectionView.backgroundColor=[UIColor whiteColor];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    [self.view addSubview:collectionView];
}

#warning mmark - 这份demo提示 添加 CollectionView 添加头部视图 做的过程中主要有其他几个注意事项 （在大神的demo继续努力）

/**  
    1.启动图片优先级  LaunchScreen  > LaunchImage > 图片命名
    2.设置下面的tabbarController下面的tabbariteam的每个item的button状态 一定要选择 UIControStateSelected。 不然控制台打印。 - - 
 
 button text attributes only respected for UIControlStateNormal, UIControlStateSelected and UIControl
 
    
 
 
 */

#pragma mark  返回多少行
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 13;
}
#pragma markk 返回的单元格
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        //添加头视图的内容
        [self addContent];
        //头视图添加view
        [header addSubview:self.headerImage];
        return header;
    }
    //如果底部视图
    //    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
    //
    //    }
    return nil;
}
/*
 *  补充头部内容
 */
-(void)addContent
{
    UIImageView *headerImage=[[UIImageView alloc]init];
    headerImage.contentMode=UIViewContentModeScaleAspectFill;
    headerImage.clipsToBounds=YES;
    headerImage.frame=CGRectMake(0, 0, self.view.frame.size.width, 200);
    headerImage.image=[UIImage imageNamed:@"mei"];
    self.headerImage=headerImage;
}


@end
