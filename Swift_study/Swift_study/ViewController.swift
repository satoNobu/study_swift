//
//  ViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label : UILabel?
    // 初回ロード時の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("初回ロード時の処理")
        // 画面タイトルを設定
        self.title = "画面タイトル"
        // ビューの背景色を指定
        self.view.backgroundColor = UIColor.blue
        
        // ラベル作成
        createLable()
        // 「次へ」ボタンの作成
        createNextBtn()
        // 「ラベルを削除する」ボタンを作成
        createRemoveBtn()
        // 「モーダル」ボタンを作成
        createModalBtn()
        
        // ナビゲーションバーを非表示にしたい場合
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // ツールバーを表示にしたい場合
//        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    // ラベル作成
    private func createLable() {
        label = UILabel()
        label!.frame = CGRect(x: 20, y:180, width:self.view.bounds.width, height:20)
        label!.backgroundColor = UIColor.clear
        label!.text = "ラベルだよ"
        self.view.addSubview(label!)
    }
    // 次へボタン作成
    private func createNextBtn() {
        let btn : UIButton = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 100, y:300, width:100, height:50)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("次へ進むよ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        // 「次へ」ボタン押下時の処理
        btn.addTarget(self, action: #selector(ViewController.onNext(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    // 「次へ」ボタン押下時の処理
    @objc func onNext(_ sender: UIButton) {
        let stroyboard = UIStoryboard(name: "Sub2", bundle: nil)
        let sub2Vc = stroyboard.instantiateInitialViewController()
        self.navigationController?.pushViewController(sub2Vc!, animated: true)
    }
    
    // 「ラベルを削除する」ボタンを作成
    private func createRemoveBtn() {
        let btn : UIButton = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 200, y:400, width:200, height:50)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("ラベルを消すよ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        // 「ラベルを消す」ボタン押下時の処理
        btn.addTarget(self, action: #selector(ViewController.onRemove(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    // 「ラベルを消す」ボタン押下時の処理
    @objc func onRemove(_ sender: UIButton) {
        label!.removeFromSuperview()
    }
    
    // 「モーダル」ボタンを作成
    private func createModalBtn() {
        let btn : UIButton = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 200, y:500, width:200, height:50)
        btn.backgroundColor = UIColor.gray
        btn.setTitle("モーダルウィンドウを出すよ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        // 「モーダル」ボタン押下時の処理
        btn.addTarget(self, action: #selector(ViewController.onModal(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    // 「モーダル」ボタン押下時の処理
    @objc func onModal(_ sender: UIButton) {
        let modal: ModalViewController = ModalViewController(nibName: nil, bundle: nil)
        // 下から表示
        modal.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        // 回転して表示
//        modal.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        // 浮かび上がって表示
//        modal.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        // めくれて表示
//        modal.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        self.present(modal, animated: true, completion: {
            modal.view.backgroundColor = UIColor.red
        })
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

