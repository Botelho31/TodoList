//
//  File.swift
//  TodoList
//
//  Created by GPS-02 on 31/08/2018.
//  Copyright © 2018 Lucas Botelho. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
