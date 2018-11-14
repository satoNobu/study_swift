//
//  AppDelegate.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /*
     * アプリの起動準備が終わった際に呼び出されるメソッド
     *
     * application：UIApplicationオブジェクト
     * launchOptions：オプション
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // StoryBoardから初回表示画面となるビューコントローラーを取得
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = stroyboard.instantiateInitialViewController()

        let subStroyboard = UIStoryboard(name: "Sub2", bundle: nil)
        let subController = subStroyboard.instantiateInitialViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        // ルートビューコントローラーを指定
//        window?.rootViewController = controller
        window?.rootViewController = subController
        // ウィンドウを表示
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("アプリがアクティブになる直前の処理")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("アプリがバックグランドになった時の処理")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("アプリがフォアグランドになった時の処理")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("アプリがアクティブになった時の処理")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("アプリが終了される時の処理")
    }


}

