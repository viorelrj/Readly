//
//  JokesAPI.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import Foundation

class JokesAPI {
    
    private static let url = "https://official-joke-api.appspot.com/jokes/ten"
    
    static func retrieveJokes(completion: @escaping ([Joke]) -> Void) {
        RequestService.retrieveData(url, resultType: Joke.self) { jokes in
            completion(jokes ?? [])
        }
    }
}
