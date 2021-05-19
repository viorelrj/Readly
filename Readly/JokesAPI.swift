//
//  JokesAPI.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//



import Foundation
import Reachability
import RxSwift

protocol IJokesApi {
    static func retrieveJokes() -> Observable<[Joke]>
}

class JokesAPI: IJokesApi {
    private static let url = "https://official-joke-api.appspot.com/jokes/ten"
    
    static func retrieveJokes() -> Observable<[Joke]> {
        return RequestService.getRequest(to: url, method: .get)
    }
}
