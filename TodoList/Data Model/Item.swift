//
//  Data.swift
//  TodoList
//
//  Created by GPS-02 on 31/08/2018.
//  Copyright © 2018 Lucas Botelho. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
