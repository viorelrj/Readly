//
//  MockJokesApi.swift
//  Readly
//
//  Created by Viorel Rinja on 5/19/21.
//

import Foundation
import Reachability
import RxSwift


class MockJokesAPI: IJokesApi {
    static func retrieveJokes() -> Observable<[Joke]> {
        let joke = Joke.init(id: 19873, setup: "Chuck Norris counted to infinity", punchline: "Twice")
        return Observable.create { observer in
            observer.onNext([joke])
            observer.onCompleted()
            return Disposables.create { }
        }
    }
}
