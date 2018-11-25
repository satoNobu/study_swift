//
//  ViewController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/10.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    // 配列
    var sectionList = ["section1","section2"]
    var todoList = [["1","2"], ["1","2","3"]]
    // Cellの識別子
    var cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Editボタンを右上に配置
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "TableView"
        navigationItem.rightBarButtonItem = editButtonItem
    }
    // テーブルの行数を返却する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList[section].count
    }
    // テーブルの行ごとのセルを返却する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellIdentifier)
        }
        // セルのタイトルの設定
        cell?.textLabel?.text = todoList[indexPath.section][indexPath.row]
        return cell!
    }
    // テーブルのセル選択時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "cellCon") as! TableViewCellController
        vc.title = sectionList[indexPath.section]
        vc.text = todoList[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // セクションの数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    // セクションのタイトルを設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }
    
    // テーブルの編集権限
    override func setEditing(_ editing: Bool, animated: Bool) {
        // override前の処理を継続してさせる
        super.setEditing(editing, animated: animated)
        // tableViewの編集モードを切り替える
        if editing {
            let newIndexPath = IndexPath(row: todoList[1].count, section: 1)
            todoList[1].append("登録する")
            self.tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.fade)
        } else {
            let indexPath = IndexPath(row: todoList[1].count-1, section: 1)
            todoList[1].remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        tableView.isEditing = editing
    }
    
    // テーブルのセルの編集権限設定
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // セクション0は編集させない
        if indexPath.section == 0 {
            return false
        }
        return true
    }
    
    // テーブルの編集形式を設定
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 1 && todoList[1].count == indexPath.row + 1 {
            return UITableViewCell.EditingStyle.insert
        }
        return UITableViewCell.EditingStyle.delete
    }
    // テーブルのセルを挿入/削除する
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            todoList[indexPath.section].remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        } else if (editingStyle == UITableViewCell.EditingStyle.insert) {
            todoList[indexPath.section].insert(String(indexPath.row+1), at: todoList[1].count-1)
            self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // テーブルのデータ移動権限設定
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // セクション1の最初の１行目だけ移動を許可させない
        if indexPath.section == 1 && 0 == indexPath.row {
            return false
        }
        return true
    }
    // テーブルのデータを移動する
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 特に処理は必要なし
    }
}
