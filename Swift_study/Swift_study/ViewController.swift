//
//  ViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 初回ロード時の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("初回ロード時の処理")
    }
    // 画面が表示される前の処理
    override func viewWillAppear(_ animated: Bool) {
        print("画面が表示される前の処理")
    }
    // 画面が表示された後の処理
    override func viewDidAppear(_ animated: Bool) {
        print("画面が表示された後の処理")
    }

    // 画面が閉じる前の処理
    override func viewWillDisappear(_ animated: Bool) {
        print("画面が閉じる前の処理")
    }
    // 画面が閉じた後の処理
    override func viewDidDisappear(_ animated: Bool) {
        print("画面が閉じた後の処理")
    }
    // メモリ不足の処理
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("メモリ不足時の処理")
    }
    
    

}

