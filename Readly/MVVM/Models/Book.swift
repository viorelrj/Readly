//
//  Book.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import Foundation
import RealmSwift

class Book: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var text = ""
    @objc dynamic var isFavourite = false
    
    static override func primaryKey() -> String? {
        return "id"
    }
}
