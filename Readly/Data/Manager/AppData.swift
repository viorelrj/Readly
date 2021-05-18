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
    static var delegate: AppDataObserver?
    
    static var favouritesBooks: [Book] {
        return books.filter { $0.isFavourite }
    }
    static var books: [Book] = []
    
    static func loadBooks() {
        
        books = Array(realm.objects(Book.self))
        if books.isEmpty {
            BooksAPI.downloadBooks().take(1).subscribe(onNext:{ books in
                saveBooks(books)
            })
        }
    }
    
    static func switchFavourite(id: String) {
        
        guard let book = books.first(where: { $0.id == id }) else {
            return
        }
        try? realm.write {
            book.isFavourite = !book.isFavourite
        }
    }
    
    static func saveBooks(_ books: [Book]) {
        try? realm.write {
            realm.add(books)
        }
        self.books.append(contentsOf: books)
        delegate?.booksDidUpdate()
    }
}
