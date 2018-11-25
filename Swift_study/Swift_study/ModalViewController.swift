//
//  ModalViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/24.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController {
    override func viewDidLoad() {
        // 背景色を設定
        self.view.backgroundColor = UIColor.gray
        // ラベルを作成
        createLable()
        // 閉じるボタン作成
        createCloseBtn()
    }
    
    // ラベル作成
    private func createLable() {
        let label = UILabel()
        label.frame = CGRect(x: 20, y:180, width:self.view.bounds.width, height:20)
        label.backgroundColor = UIColor.clear
        label.text = "モーダルだよ"
        self.view.addSubview(label)
    }
    // 「閉じる」ボタン作成
    private func createCloseBtn() {
        let btn : UIButton = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 0, y:0, width:100, height:50)
        btn.center = self.view.center
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.white
        btn.setTitle("とじる", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        // 「閉じる」ボタン押下時の処理
        btn.addTarget(self, action: #selector(self.onClose(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    // 「閉じる」ボタン押下時の処理
    @objc func onClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
