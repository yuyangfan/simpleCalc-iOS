//
//  ViewController.swift
//  SimpleCalc-iOSVersion
//
//  Created by Yuyang Fan on 10/21/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UITextField!
    
    var result : Double = 0.0
    var currentNumber : Double = 0.0
    var isDecimal : Bool = false
    var currentOp : String = "="
    var count : Int = 1
    var total : Double = 0.0
    var countDec : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        labelResult.text = "\(result)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnInput(sender: UIButton) {
        if (sender.titleLabel!.text == ".") {
            isDecimal = true
           
        }else if (isDecimal == true) {
            countDec = countDec + 1
            currentNumber = currentNumber + Double(sender.titleLabel!.text!)! / Double(calcTens(countDec))
         }
        else {
            currentNumber = currentNumber * 10 + Double(sender.titleLabel!.text!)!
        }
       labelResult.text = "\(currentNumber)"
    }
    
    func calcTens (var incoming: Int) -> Int {
        var res : Int = 1
        while (incoming > 0) {
            res *= 10
            incoming = incoming - 1
        }
        return res
    }
    @IBAction func btnOperation(sender: UIButton) {
        isDecimal = false
        countDec = 0
        switch currentOp {
            case "=":
                result = currentNumber
            case "+":
                result = result + currentNumber
            case "-":
                result = result - currentNumber
            case "*":
                result = result * currentNumber
            case "/":
                result = result / currentNumber
            case "%":
                result = result % currentNumber
            case "Fact":
                result = factorial(result)
            
            case "Count":
                count = count + 1
                result = Double(count)
            
            case "Avg":
                count = count + 1
                result = result + currentNumber
            
            default:
                print("error")
        }
        
        currentNumber = 0
    
        if (currentOp == "Avg" && sender.titleLabel!.text! == "=") {
            result = result / Double(count)
        }
        currentOp = sender.titleLabel!.text!
        labelResult.text = "\(result)"
    }
    
    // Returns the factorial of a given number, returns 1 if given number is 0
    func factorial(incoming:Double) -> Double {
        if (incoming == 0) {
            return 1
        } else {
            return incoming * factorial(incoming - 1)
        }
    }
    
    
    
    @IBAction func btnClear(sender: UIButton) {
        currentNumber = 0
        isDecimal = false
        currentOp = "="
        count = 1
        result = 0
        total = 0
        labelResult.text = "\(result)"
        countDec = 0
    }
}

