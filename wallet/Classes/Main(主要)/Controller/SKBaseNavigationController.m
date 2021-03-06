//
//  SKBaseNavigationController.m
//  Business
//
//  Created by talking　 on 2018/8/15.
//  Copyright © 2018年 talking　. All rights reserved.
//

#import "SKBaseNavigationController.h"

@interface SKBaseNavigationController ()

@end

@implementation SKBaseNavigationController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize {
    // 设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    // 设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = SKWhiteColor;//QYThemeColor;
    
    //状态栏的字体颜色变成白色     //设置全局状态栏字体颜色为白色
//    [UINavigationBar appearance].barStyle = UIStatusBarStyleLightContent;
    
    
    
    // 设置导航栏标题文字颜色
    // 创建字典保存文字大小和颜色
    NSMutableDictionary * color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = SKFontBig(16.0f);
    color[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#333333"] ;//SKWhiteColor;
    
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    
    // 拿到整个导航控制器的外观
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    item.tintColor = SKWhiteColor;
    //        item.tintColor = HLThemeColor;
    
    // 设置字典的字体大小
    NSMutableDictionary * atts = [NSMutableDictionary dictionary];
    
    atts[NSFontAttributeName] = SKFontBig(16.0f);
    //    atts[NSForegroundColorAttributeName] = HLBlackColor;
    atts[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#333333"];
    
    
    // 将字典给item
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    
    //    去掉一像素的线
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        
        /**
         *  如果在堆栈控制器数量大于1 加返回按钮
         */
        if (self.viewControllers.count > 0) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 40)];
            [btn setImage:[UIImage imageNamed:@"reurnGenal"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"reurnGenal"] forState:UIControlStateHighlighted];
            
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
            btn.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            [btn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.leftBarButtonItem = leftItem;
        } else {
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" tintColor:[UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f] touchBlock:nil];
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
