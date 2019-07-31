//
//  Todo.swift
//  RealmTodo
//
//  Created by SeitoYachimoto on 2019/07/30.
//  Copyright © 2019 谷地元　星斗. All rights reserved.
//

import RealmSwift

class Todo: Object {
    
//    ID
    @objc dynamic var id: Int = 0
//    title
    @objc dynamic var title: String = ""
//    登録日時
    @objc dynamic var date: Date = Date()


    
}
