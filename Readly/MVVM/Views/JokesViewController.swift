//
//  JokesViewController.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import UIKit

class JokesViewController: UIViewController {

    let viewModel = JokesViewModel()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.updateJokesView = { [weak self] in
            self?.table.reloadData()
        }
    }
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfJokes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.getJokeSetup(index: indexPath.row)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension JokesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(identifier: "PunchlineViewController") as PunchlineViewController
        vc.punchlineText = viewModel.getJokePunchline(index: indexPath.row)
        present(vc, animated: true, completion: nil)
    }
}
