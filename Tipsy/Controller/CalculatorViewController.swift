//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Hrutuja on 15/01/25.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipsyModel = TipsyModel()
    
    var selectedTip = 0.10
    var numberOfPeople = 2
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        selectedTip = Double(sender.currentTitle!.replacingOccurrences(of: "%", with: ""))!
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Double(billTextField.text!) ?? 0.0
        selectedTip = selectedTip / 100
        tipsyModel.calculateBill(billTotal: billTotal, tip: selectedTip, split: numberOfPeople)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.result = tipsyModel.getResults()
                destinationVC.tip = Int(selectedTip * 100)
                destinationVC.split = numberOfPeople
            }
        }
    }
}

