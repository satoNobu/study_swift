//
//  ViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    // コレクションに表示するデータ
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // セルの詳細なレイアウトを設定する
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // セルのサイズ
        flowLayout.itemSize = CGSize(width: 100.0, height: 100.0)
        // 縦・横のスペース
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 12.0
        //  スクロールの方向
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        // 上で設定した内容を反映させる
        self.collectionView.collectionViewLayout = flowLayout
        // 背景色を設定
        self.collectionView?.backgroundColor =  UIColor.lightGray
        
        // 配列を初期化（コレクションに表示するデータを作成）
        for i in 0 ..< 100 {
            items.append(String(i))
        }
    }
    
    // セクションの数を決める
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // セクション内のセルの数を決める
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // セルのデータを表示
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // セルを生成し、X番目に相当するデータを表示
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.black
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text =  items[indexPath.row]
        label.textColor = UIColor.red
        return cell
    }
    
    // セルが選択された時の処理を指定する
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert : UIAlertController = UIAlertController(title: "タイトル", message: "\(items[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
