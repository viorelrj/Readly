//
//  PunchlineViewController.swift
//  Readly
//
//  Created by maughray on 4/17/21.
//

import UIKit

class PunchlineViewController: UIViewController {
    
    let viewModel = PunchlineViewModel()
    @IBOutlet weak var punchline: UILabel!
    var punchlineText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.punchline.text = punchlineText
    }
}
