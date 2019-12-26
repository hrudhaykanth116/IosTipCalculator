//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Hrudhay.Thangella on 15/12/19.
//  Copyright © 2019 hrudhaykanth116. All rights reserved.
//

import Foundation
import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: - IBOutlets
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    // MARK: - Properties
    
    var tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2)
    
    // MARK: - View controller lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip: %d%%: ", arguments: [Int(tipCalc.tipPercentage * 100)])
        
    }
    
    func calcTip(){
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = Float(amountBeforeTaxTextField.text!)!
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI(){
        resultLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", arguments: [tipCalc.totalAmount, tipCalc.tipAmount])
    }
    
    // MARK: - UI Control events
    
    @IBAction func amountBeforeTaxTextFieldChanged(_ sender: Any) {
        print("amountBeforeTaxTextFieldChanged")
        calcTip()
    }
    
    // Triggered when clicked on done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == amountBeforeTaxTextField{
            print("textFieldShouldReturn")
            // Keyboard closes.
            textField.resignFirstResponder()
            calcTip()
            
        }
        return true
    }
    
    // Outlet for slider value changed.
    @IBAction func tipPercentageSliderValueChanged(_ sender: Any) {
        
        tipPercentageLabel.text = String(format: "Tip:%02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
    
    
}
