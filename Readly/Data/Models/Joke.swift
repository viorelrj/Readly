//
//  Joke.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
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
