//
//  ViewController.swift
//  RealmTodo
//
//  Created by SeitoYachimoto on 2019/07/30.
//  Copyright © 2019 谷地元　星斗. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var todos:[Todo] = []
    
    fileprivate func reloadtableView() {
        //    Realmに接続
        let realm = try! Realm()
        //    Todoの一覧を取得する
        todos = realm.objects(Todo.self).reversed()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.dataSource = self
        tableView.delegate = self
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        reloadtableView()
    }

    @IBAction func didClickbuttom(_ sender: UIButton) {
   
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    let todo = todos[indexPath.row]
    cell.textLabel?.text = todo.title
    
//    セルに矢印をつける
    cell.accessoryType = .disclosureIndicator
    
    return cell
}
// セルがクリックされた時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        クリックされたTODOを取得する
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "toNExt", sender: todo)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext"{
//            次の画面のControllerを取得
            let inputVC = segue.destination as! InputViewController
            
//            次の画面に選択されたTodoを設定
            inputVC.todo = sender as? Todo
            
            
        }
    }
    
}
