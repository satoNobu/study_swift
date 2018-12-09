//
//  ViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    let con1 = View1()
    let con2 = View2()
    let con3 = View3()
    var con1Cnt : Int = 0
    var con2Cnt : Int = 0
    var con3Cnt : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タブのタイトルとタグを設定
        con1.tabBarItem.title = "AAAAA"
        con1.tabBarItem.tag = 1
        
        con2.tabBarItem.title = "BBBBB"
        con2.tabBarItem.tag = 2
        
        con3.tabBarItem.title = "CCCCC"
        con3.tabBarItem.tag = 3
        
        let conList : Array<UIViewController> = [con1, con2, con3]
        self.setViewControllers(conList, animated: false)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            con1Cnt += 1
            // バッチを指定
            con1.tabBarItem.badgeValue = String(con1Cnt)
        case 2:
            con2Cnt += 1
            // バッチを指定
            con2.tabBarItem.badgeValue = String(con2Cnt)
        case 3:
            con3Cnt += 1
            // バッチを指定
            con3.tabBarItem.badgeValue = String(con3Cnt)
        default:
            break
        }
    }
}

