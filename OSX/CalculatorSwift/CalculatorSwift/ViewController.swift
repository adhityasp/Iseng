//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by Adhitya Surya Pratama on 5/6/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var isTyping = false //typing check
    var model = CalculatorModel() //new Model
    
    var displayDouble : Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isTyping == false{
            display.text! = digit
            isTyping = true
        }
        else{
            display.text! = display.text! + digit
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if isTyping{
            model.setOperand(displayDouble)
            isTyping = false
        }
        if let operationSymbol = sender.currentTitle{
            model.operation(operationSymbol)
        }
        if let result = model.result{
            displayDouble = result
        }
        
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

