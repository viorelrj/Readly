//
//  BooksAPI.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import Foundation
import SwiftyJSON
import Reachability
import RxSwift

class BooksAPI {
    private static let url = "https://www.googleapis.com/books/v1/volumes?q=quilting"
    
    static func downloadBooks() -> Observable<[Book]> {
        return RequestService.getRequest(to: url, method: .get).map { (result: BooksResponse) in
            return result.items.map {Book(
                _id:$0.id,
                _title:$0.volumeInfo.title,
                _text:$0.volumeInfo.description ?? ""
            )}
        }
    }
}

struct BooksResponse: Codable {
    var items: [BookItem]
}

struct BookItem: Codable {
    var id: String
    var volumeInfo: VolumeInfo
    var isFavourite: Bool?
}

struct VolumeInfo: Codable {
    var title: String
    var description: String?
}
