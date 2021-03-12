//
//  BookListItem.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import UIKit

class BookListItem: UICollectionViewCell {
    static let identifier = "BookListItem"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with book: Book) {
        label.text = book.title
        self.book = book
        
        updateButtonTitle()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: BookListItem.identifier, bundle: nil)
    }
    
    
    @IBAction func onTapFavourite(_ sender: UIButton) {
        
        guard let book = book else {
            return
        }
        AppData.switchFavourite(id: book.id)
        updateButtonTitle()
    }
    
    func updateButtonTitle() {
        
        guard let book = book else {
            return
        }
        if AppData.favouritesBooks.contains(book) {
            addButton.setTitle("Dislike", for: .normal)
        }
        else {
            addButton.setTitle("Favourite", for: .normal)
        }
    }
}
