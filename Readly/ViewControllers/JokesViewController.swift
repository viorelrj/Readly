//
//  JokesViewController.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import UIKit

class JokesViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    lazy var jokes: [Joke] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JokesAPI.retrieveJokes().take(1).subscribe(onNext: {jokes in
            self.jokes = jokes;
            DispatchQueue.main.async { self.table.reloadData() }
        })
    }
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = jokes[indexPath.row].setup
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension JokesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(identifier: "PunchlineViewController") as PunchlineViewController
        vc.punchlineText = jokes[indexPath.row].punchline
        present(vc, animated: true, completion: nil)
    }
}
