//
//  PunchlineViewController.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

import UIKit

class PunchlineViewController: UIViewController {
    
    @IBOutlet weak var punchline: UILabel!
    var punchlineText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.punchline.text = punchlineText
    }
}
