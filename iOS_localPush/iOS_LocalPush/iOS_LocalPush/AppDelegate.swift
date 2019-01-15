//
//  AppDelegate.swift
//  iOS_LocalPush
//
//  Created by 信次　智史 on 2019/01/14.
//  Copyright © 2019 stoshi nobutsugu. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // PUSH要求する
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                
                if !granted {
                    let alert = UIAlertController(title: "通知がOFF", message: "プッシュ通知がOFF。PUSHは届かない", preferredStyle: .alert)
                    let cancelAction: UIAlertAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.cancel, handler:{
                        (action: UIAlertAction!) -> Void in
                        print("cancelAction")
                    })
                    alert.addAction(cancelAction)
                    self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "通知ON", message: "プッシュ通知がON。PUSHが届く", preferredStyle: .alert)
                    let cancelAction: UIAlertAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.cancel, handler:{
                        (action: UIAlertAction!) -> Void in
                        print("cancelAction")
                    })
                    alert.addAction(cancelAction)
                    self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            })
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([ .badge, .sound, .alert ])
    }
}
