//
//  LibraryViewModel.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import Foundation

class LibraryViewModel {
    
    var updateCollection: (() -> Void)?
    
    init() {
        AppData.delegate = self
    }
    
    func numberOfRows() -> Int {
        return AppData.books.count
    }
    
    func getBook(index: Int) -> Book {
        return AppData.books[index]
    }
}

extension LibraryViewModel: AppDataObserver {
    func booksDidUpdate() {
        updateCollection?()
    }
}
