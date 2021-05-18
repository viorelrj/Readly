//
//  Book.swift
//  Readly
//
//  Created by Viorel Rinja on 5/12/21.
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
    
    init(_id: String, _title: String, _text: String) {
        super.init()
        id = _id
        title = _title
        text = _text
    }
    
    override init() {
        super.init()
    }
}
