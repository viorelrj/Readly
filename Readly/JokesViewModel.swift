//
//  JokesViewModel.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import Foundation

class JokesViewModel {
    var updateJokesView: (() -> Void)?
    private lazy var jokes: [Joke] = []
    
    init() {
        let mock = CommandLine.arguments.contains("-ui-test")
        
        if (mock) {
            MockJokesAPI.retrieveJokes().take(1).subscribe(onNext: {jokes in
                self.jokes = jokes
                self.updateJokesView?()
            })
        } else {
            JokesAPI.retrieveJokes().take(1).subscribe(onNext: {jokes in
                self.jokes = jokes
                self.updateJokesView?()
            })
        }
    }
    
    func getNumberOfJokes() -> Int {
        return jokes.count
    }
    
    func getJokeSetup(index: Int) -> String {
        return jokes[index].setup ?? ""
    }
    
    func getJokePunchline(index: Int) -> String {
        return jokes[index].punchline ?? ""
    }
}
