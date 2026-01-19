//
//  ViewController.swift
//  Pay-Bill
//
//  Created by ABDUR RAFAY on 19/10/2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage : Float = 0.0
    var numberOfPeople = 0
    var finalResult = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
    
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        // Get the title of the button and remove the "%" sign
        let buttonTitle = sender.currentTitle!
        let buttonTitleRemovePercentageSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Float(buttonTitleRemovePercentageSign)
        tipPercentage = buttonTitleAsANumber! / 100
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    func calculateBill() -> String?{
        
        let bill = billTextField.text!
        if bill != ""{
            let billTotal = Float(bill)
            
            let tip = billTotal! * tipPercentage
            let finalAmount = billTotal! + tip
            let amountPerPerson = finalAmount / Float(numberOfPeople)
            
            finalResult = String(format: "%.0f",amountPerPerson)
            return finalResult
        }
        return nil
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let call = calculateBill()
        performSegue(withIdentifier: "goToRVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToRVC"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
        }
    }
    
}

