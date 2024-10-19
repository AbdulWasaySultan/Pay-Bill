//
//  ResultViewController.swift
//  Pay-Bill
//
//  Created by ABDUR RAFAY on 19/10/2024.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    var result = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

     totalLabel.text = result
    }
    

    @IBAction func recalculateButton(_ sender: UIButton) {

        dismiss(animated: true,completion: nil)

    }
    
}
