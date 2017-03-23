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
        guard let loanAmountField = loanAmountField.text,let yearField = yearField.text,let interestRateField = interestRateField.text
            else {
                print ("用户没有输入全部数据")
                return
        }
        guard let loanAmount = Double(loanAmountField),let year = Int(yearField),let interestRate = Double(interestRateField)
            else {
            print("用户输入格式有错误")
            return
        }
        resultField.text = calculate1.simplecalculate(LoanAmount:loanAmount ,years:year ,interestRate:interestRate).money
       // print(calculate1)
  //      resultField.text = calculate1.simplecalculate(LoanAmount: Double(loanAmountField.text!)!, years: Int (yearField.text!)!, interestRate: Double(interestRateField.text!)!).money
    }


    @IBAction func compoundcalculateField(_ sender: Any) {
        let calculate2 = compoundCalculate()
        
        resultField.text = calculate2.calculate(LoanAmount: Double(loanAmountField.text!)!, years: Int (yearField.text!)!, interestRate: Double(interestRateField.text!)!).money

    }
    
    override func touchesEnded(_ touches: Set<UITouch>,with event: UIEvent?){
        loanAmountField.resignFirstResponder()
        yearField.resignFirstResponder()
        interestRateField.resignFirstResponder()
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
extension Double{
    var money : String{
        let formater = NumberFormatter()
        formater.numberStyle = .currency
        let result:String?
        result = formater.string(from:NSNumber(value:self))
        if result == nil{
            return"format error"
        }
        return result!
    }
    
}
