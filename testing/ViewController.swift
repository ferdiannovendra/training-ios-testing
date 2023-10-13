//
//  ViewController.swift
//  testing
//
//  Created by P090MMCTSE014 on 12/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    var anu = 0

    @IBAction func buttonClicked(_ sender: Any) {
        if anu == 0 {
            mainLabel.text = "wqwqqwq"
            anu += 1
        } else {
            mainLabel.text = "hahahaha"
            anu = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

