//
//  Joke.swift
//  Readly
//
//  Created by maughray on 4/17/21.
//

import Foundation
import ObjectMapper

class Joke: Mappable {
    var id: Int?
    var setup: String?
    var punchline: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        setup <- map["setup"]
        punchline <- map["punchline"]
    }
}
