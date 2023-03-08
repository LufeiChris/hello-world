//
//  AppDelegate.swift
//  Newvision
//
//  Created by chenruibao on 2022/9/20.
//

import UIKit


@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = .white
    
//        var m_pPPPPChannelMgt = CPPPPChannelManagement().init
        
        let tabVC = LFCTabbarViewController.init()
        let homeVC = LFCHomeVC.init()
        let homeNav = self.addChildVc(childVc: homeVC, title:"Home", image: "home_unse", selectedImage: "home_se")
        let recordVC = LFCRecordVC.init()
        let recordNav = self.addChildVc(childVc: recordVC, title:"Record", image: "record_unse", selectedImage: "record_se")
        let mineVC = LFCMineVC.init()
        let mineNav = self.addChildVc(childVc: mineVC, title:"Mine", image: "my_unse", selectedImage: "my_se")
        
        tabVC.viewControllers = [homeNav,recordNav,mineNav]
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
     
        
        return true
    }

    func addChildVc(childVc:UIViewController,title:String,image:String,selectedImage:String) -> UINavigationController  {
        
        // 设置子控制器的文字
            childVc.title = title; // 同时设置tabbar和navigationBar的文字

        
            // 设置子控制器的图片
        childVc.tabBarItem.image = UIImage.init(named: image)
        childVc.tabBarItem.selectedImage = UIImage.init(named: selectedImage)


//            //未选中字体颜色  system为系统字体
//            [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
//
//
//            //选中字体颜色
//            [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:SubjectColor(1),NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
        
        
        // 先给外面传进来的小控制器 包装 一个导航控制器
        let nav = UINavigationController.init(rootViewController: childVc)
//        nav.navigationBar.barTintColor = RGB(243, 243, 243);
//        nav.navigationBar.backgroundColor = RGB(243, 243, 243);
//    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
//       nav.navigationBar.titleTextAttributes = dict;
//       [nav.navigationBar setTranslucent:NO];
//     nav.navigationBar.barStyle = UIStatusBarStyleDefault;
//       [nav.navigationBar setTintColor:[UIColor blackColor]];
    


    
    
        return nav;
        
    }

}

