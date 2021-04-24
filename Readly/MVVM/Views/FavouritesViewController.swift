//
//  FavouritesViewController.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    let viewModel = FavouritesViewModel()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        table.reloadData()
    }
}

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.getBookTitle(index: indexPath.row)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension FavouritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(identifier: "read") as ReadViewController
        vc.text = viewModel.getBookTitle(index: indexPath.row)
        vc.bookTitle = viewModel.getBookText(index: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}
