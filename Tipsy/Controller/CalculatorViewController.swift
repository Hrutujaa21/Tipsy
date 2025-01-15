//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Hrutuja on 15/01/25.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var val: String?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        val = sender.currentTitle!
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let percentValue = Double(val!.replacingOccurrences(of: "%", with: "")) {
            print(String(format: "%.1f", percentValue/100))
        }
        print(splitNumberLabel.text!)

        
    }
}

