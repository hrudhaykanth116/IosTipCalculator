//
//  TipCalc.swift
//  TipCalculator
//
//  Created by Hrudhay.Thangella on 15/12/19.
//  Copyright © 2019 hrudhaykanth116. All rights reserved.
//

import Foundation

class TipCalc{
    
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip(){
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = amountBeforeTax + tipAmount
    }
    
    
    
}
