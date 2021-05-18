//
//  ReadViewController.swift
//  Readly
//
//  Created by Viorel Rinja on 3/11/21.
//

import UIKit

class ReadViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let viewModel = ReadViewModel()
    
    var bookTitle = ""
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = bookTitle
        textView.text = text
    }
}
