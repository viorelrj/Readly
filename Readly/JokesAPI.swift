//
//  JokesAPI.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import Foundation
import Reachability
import RxSwift

class JokesAPI {
    private static let url = "https://official-joke-api.appspot.com/jokes/ten"
    
    static func retrieveJokes() -> Observable<[Joke]> {
        return RequestService.getRequest(to: url, method: .get)
    }
}
