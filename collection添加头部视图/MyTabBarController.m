//
//  MyTabBarController.m
//  collection添加头部视图
//
//  Created by Eclectic on 15/12/20.
//  Copyright © 2015年 Eclectic. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"

@interface MyTabBarController ()


- (void)addChildVc;
/**  添加控制器的方法 */
- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;
@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVc];

}

- (void)addChildVc
{
    // 1.添加首页控制器
    HomeViewController * homeVc = [[HomeViewController alloc] init];
    [self addChildViewController:homeVc title:@"首页" image:@"tabbar_icon_news_normal" selectedImage:@"tabbar_icon_news_highlight"];
    // 阅读
    UIViewController * read = [[UIViewController alloc] init];
    [self addChildViewController:read title:@"阅读" image:@"tabbar_icon_reader_normal" selectedImage:@"tabbar_icon_reader_highlight"];
    
    // 试听
    UIViewController * video = [[UIViewController alloc] init];
    [self addChildViewController:video title:@"试听" image:@"tabbar_icon_media_normal" selectedImage:@"tabbar_icon_media_highlight"];
    // 发现
    UIViewController * discover = [[UIViewController alloc] init];
    [self addChildViewController:discover title:@"发现" image:@"tabbar_icon_found_normal" selectedImage:@"tabbar_icon_found_highlight"];
    // 我
    UIViewController * profile = [[UIViewController alloc] init];
    [self addChildViewController:profile title:@"我" image:@"tabbar_icon_me_normal" selectedImage:@"tabbar_icon_me_highlight"];
    
    

}

- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    
    // 设置选中图片
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字样式
    NSMutableDictionary * textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    // 选中文字样式
    NSMutableDictionary * selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:206/255.0 green:24/255.0 blue:36/255.0 alpha:1.0];
    
    [childVc.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
