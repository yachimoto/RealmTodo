//
//  InputViewController.swift
//  RealmTodo
//
//  Created by SeitoYachimoto on 2019/07/30.
//  Copyright © 2019 谷地元　星斗. All rights reserved.
//

import UIKit
import RealmSwift


class InputViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
//    前の場面から渡されてきたTODOを受け取る変数
    var todo: Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    fileprivate func createNewTodo(_ text: String) {
        //        Realmに接続
        let realm = try! Realm()
        
        //        データを登録する
        let todo = Todo()
        //        最大のIDを取得する
        let id = getMaxId()
        
        todo.id = id
        todo.title = text
        todo.date = Date()
        
        try! realm.write {
            realm.add(todo)
        }
    }
    
    @IBAction func didClickAddBtn(_ sender: UIButton) {
            
            // nilかチェックをする
            guard let text = textField.text else {
                // textField.textがnilの場合
                // ボタンがクリックされた時の処理を中断
                return
            }
            
            if text.isEmpty {
                // textField.textが空文字の場合
                // ボタンがクリックされた時の処理を中断
                return
            }
        
//        新規タスクを追加
        createNewTodo(text)
        
//        前の画面に戻る
//        NavicationControllerの持っている履歴から、一つ前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
    
    func getMaxId() -> Int {
        
        //        Realmに接続
        let  realm = try! Realm()
        //        Todoのシートから最大のIDを取得する
        let id = realm.objects(Todo.self).max(ofProperty: "id") as Int?

        if id == nil{
            //            最大IDがnil(存在しない)場合、１を返す
            return 1
        } else {
            //            最大IDが存在する場合、最大ID ＋ 1 を返す
            return id! + 1
        }
        
    }
}
