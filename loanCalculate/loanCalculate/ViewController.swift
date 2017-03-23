//
//  ViewController.swift
//  loanCalculate
//
//  Created by 上海海洋大学 on 17/3/17.
//  Copyright © 2017年 上海海洋大学. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var resultField: UILabel!
    
    @IBAction func calculateField(_ sender: Any) {
    let calculate1 = simpleCalculate()
        
        resultField.text = calculate1.simplecalculate(LoanAmount: Double(loanAmountField.text!)!, years: Int (yearField.text!)!, interestRate: Double(interestRateField.text!)!).description
    }

    @IBAction func compoundcalculateField(_ sender: Any) {
        let calculate2 = compoundCalculate()
        
        resultField.text = calculate2.calculate(LoanAmount: Double(loanAmountField.text!)!, years: Int (yearField.text!)!, interestRate: Double(interestRateField.text!)!).description
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
    
class simpleCalculate {
    func simplecalculate(LoanAmount:Double,years:Int,interestRate:Double)->Double{
        let rate=interestRate/100
        let interest=LoanAmount*rate*Double (years)
        return LoanAmount+interest
    }
    
}
  class compoundCalculate {
    func calculate(LoanAmount:Double,years:Int,interestRate:Double) -> Double{
        let  rate=interestRate/100
        let compoundInterest=pow(1.0+rate, Double(years))
        return compoundInterest*LoanAmount
    }
}


