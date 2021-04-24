//
//  AppData.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import Foundation
import RealmSwift

class AppData {
    
    static private let realm = try! Realm()
    static var favouritesBooks: [Book] {
        return books.filter { $0.isFavourite }
    }
    static var books: [Book] = []
    
    static func loadBooks() {
        
        books = Array(realm.objects(Book.self))
        if books.isEmpty {
            populateBooks()
        }
    }
    
    static func switchFavourite(id: Int) {
        
        guard let book = books.first(where: { $0.id == id }) else {
            return
        }
        try? realm.write {
            book.isFavourite = !book.isFavourite
        }
    }
    
    private static func populateBooks() {
        
        try? realm.write {
        
            for i in 0...30 {
                
                let b = Book()
                b.id = i
                b.title = "Lord \(i)"
                b.text = String(repeating: b.title, count: 5000)
                b.isFavourite = false
                realm.add(b)
                books.append(b)
            }
            
        }
    }
}
