//
//  FavouritesViewController.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        table.reloadData()
    }
}

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.favouritesBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = AppData.favouritesBooks[indexPath.row].title
        return cell
    }
}

extension FavouritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = AppData.favouritesBooks[indexPath.row]
        let text = book.text
        
        let vc = storyboard!.instantiateViewController(identifier: "read") as ReadViewController
        vc.text = text
        vc.bookTitle = book.title
        navigationController?.pushViewController(vc, animated: true)
    }
}
