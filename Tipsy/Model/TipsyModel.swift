//
//  TipsyModel.swift
//  Tipsy
//
//  Created by Dipak Patil on 15/01/25.
//

import Foundation

struct TipsyModel {
    
    var tipsy: Tipsy?
    
    func getResults() -> Double {
        tipsy?.result ?? 0.0
    }
    
    mutating func calculateBill(billTotal: Double, tip: Double, split: Int) {
        
        let totalAmount = (billTotal * (1 + tip)) / Double(split)
        
        tipsy = Tipsy(result: totalAmount)
    }
}
