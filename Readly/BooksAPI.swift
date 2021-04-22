//
//  BooksAPI.swift
//  Readly
//
//  Created by maughray on 4/17/21.
//

import Foundation
import SwiftyJSON

class BooksAPI {
    
    private static let url = "https://www.googleapis.com/books/v1/volumes?q=quilting"
    
    static func downloadBooks() {
        RequestService.retrieveData(url) { data, statusCode in
            guard let data = data, let json = try? JSON(data: data) else {
                return
            }
            var result: [Book] = []
            for item in json["items"].arrayValue {
                let b = Book()
                b.id = item["id"].stringValue
                b.title = item["volumeInfo"]["title"].stringValue
                b.text = item["volumeInfo"]["description"].stringValue
                b.isFavourite = false
                result.append(b)
            }
            AppData.saveBooks(result)
        }
    }
}
