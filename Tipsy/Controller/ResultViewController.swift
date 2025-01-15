//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Hrutuja on 15/01/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: Double?
    var split = 2
    var tip = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = (String(format: "%.2f", result ?? 0.0))
        settingsLabel.text = "Split between \(split) people with a \(tip)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
