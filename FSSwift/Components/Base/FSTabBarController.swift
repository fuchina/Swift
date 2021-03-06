//
//  FSTabBarController.swift
//  FSSwift
//
//  Created by Guazi on 2017/12/2.
//  Copyright © 2017年 china. All rights reserved.
//

import UIKit

class FSTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMainFrameWork()
//        tabDesignViews()
    }
    
    func createMainFrameWork() -> Void {
        let count = titles.count
        var vcs = Array() as [UINavigationController]
        for x in 0...count-1 {
            var controller : FSBaseController?
            var type : UITabBarSystemItem!
            if x == 0 {
                controller = FSHomeController()
                type = UITabBarSystemItem.mostViewed
            }else if x == 1 {
                controller = FSSecondController()
                type = UITabBarSystemItem.favorites
            }else if x == 2 {
                controller = FSMeController()
                type = UITabBarSystemItem.contacts
            }
            
            let myNavigation = UINavigationController.init(rootViewController: controller!)
            let tbi = UITabBarItem.init(tabBarSystemItem: type, tag: x)
            tbi.setValue(titles[x], forKeyPath: "_title")
            UITabBar.appearance().tintColor = AppColor_Red
            
            myNavigation.tabBarItem = tbi
            vcs.append(myNavigation)
        }
        viewControllers = vcs
    }
    
    let titles = ["首页","分页","我"]
    let unselects = ["tab_home_unselect","tab_second_unselect","tab_third_unselect"]
    let selects = ["tab_home_select","tab_second_select","tab_third_select"]
    
    let color = FSKit.rgbColor(r: 2, g: 195, b: 134, a: 1)
    func tabDesignViews() -> Void {
        view.backgroundColor = UIColor.white
        
        var vcs = Array() as [UINavigationController]
        for x in 0...2 {
            var controller : FSBaseController?
            if x == 0 {
                controller = FSHomeController()
            }else if x == 1 {
                controller = FSSecondController()
            }else if x == 2 {
                controller = FSMeController()
            }
            
            let myNavigation = UINavigationController.init(rootViewController: controller!)
            myNavigation.tabBarItem.title = titles[x]
            myNavigation.tabBarItem.image = UIImage.init(named: unselects[x])?.withRenderingMode(.alwaysOriginal)
            myNavigation.tabBarItem.selectedImage = UIImage.init(named: selects[x])?.withRenderingMode(.alwaysOriginal)
            vcs.append(myNavigation)
            
            let attributes = [NSAttributedStringKey.foregroundColor: color]
            myNavigation.tabBarItem.setTitleTextAttributes(attributes , for: UIControlState.selected)
        }
        viewControllers = vcs
        selectedIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
