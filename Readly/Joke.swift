//
//  Joke.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import Foundation
import RealmSwift

struct Joke: Codable {
    var id: Int?
    var setup: String?
    var punchline: String?
}
