//
//  FavouritesViewModel.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import Foundation

class FavouritesViewModel {
    
    func numberOfRows() -> Int {
        return AppData.favouritesBooks.count
    }
    
    func getBookTitle(index: Int) -> String {
        return AppData.favouritesBooks[index].title
    }
    
    func getBookText(index: Int) -> String {
        return AppData.favouritesBooks[index].text
    }
}
