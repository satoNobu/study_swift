//
//  ViewController.swift
//  iOS_LocalPush
//
//  Created by 信次　智史 on 2019/01/14.
//  Copyright © 2019 stoshi nobutsugu. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func localPushTapped(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "PUSH1"
        content.body = "ボタンタップでPUSH通知"
        content.sound = UNNotificationSound.default
        // 直ぐに通知を表示
        let request = UNNotificationRequest(identifier: "localPushTest1", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    @IBAction func localPushTapped2(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "PUSH2"
        content.body = "時間差でPUSH通知、フォアグランドで通知くる"
        content.sound = UNNotificationSound.default
        // ５秒後に通知
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "localPushTest2", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
}

