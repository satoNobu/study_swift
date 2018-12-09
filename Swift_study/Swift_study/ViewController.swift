//
//  ViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func tapBtn(_ sender: Any) {
        print("A")
        Process1(time: 10, complete: test1)
    }
    // クロージャーを引数にとる関数
    func Process1(time: Double, complete:  @escaping () -> Void) {
        // 非同期処理
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            complete()
        }
    }
    // 背景色を赤にする
    func test1() {
        view.backgroundColor = UIColor.red
    }
    
    @IBAction func tapBtn2(_ sender: Any) {
        print("B")
        Process2(time: 2, complete: test2)
    }
    
    // クロージャーに引数を追加してみる
    func Process2(time: Double, complete: @escaping (String) -> Void) {
        // 非同期処理
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            complete("black")
        }

    }
    // 背景色を黒にする
    func test2(color: String) {
        print("\(color)")
        view.backgroundColor = UIColor.black
    }
    
    @IBAction func tapBtn3(_ sender: Any) {
        print("C")
        Process3(time: 10, complete: test3)
    }
    // クロージャーに戻り値を設定
    func Process3(time: Double, complete: @escaping (Int) -> Int) {
        
        // 同期処理
        let semaphore = DispatchSemaphore(value: 0)
        // セマフォをインクリメント（+1）
        semaphore.signal()
        print("C-start")
        Thread.sleep(forTimeInterval: 5)
        print("C-end")
        semaphore.wait()
        let count = complete(10)
        print("count:\(count)")
        
        // セマフォをデクリメント（-1）、ただしセマフォが0の場合はsignal()の実行を待つ
    
    }
    // 背景色を青にする
    func test3(count: Int) -> Int {
        view.backgroundColor = UIColor.blue
        return count
    }
    
    @IBAction func tapBtn4(_ sender: Any) {
        print("D")
        Process4(time: 2, complete: test4)
    }
    
    // 引数複数
    func Process4(time: Double, complete: @escaping (Int,Int) -> Int) {
        
        // 同期処理
        let semaphore = DispatchSemaphore(value: 0)
        // セマフォをインクリメント（+1）
        semaphore.signal()
        print("D-start")
        Thread.sleep(forTimeInterval: 10)
        print("D-end")
        semaphore.wait()
        let count = complete(10, 2)
        print("count:\(count)")
        
    }
    // 背景色を黄色にする
    func test4(a:Int, b:Int) -> Int {
        view.backgroundColor = UIColor.yellow
        return a * b
    }
}

