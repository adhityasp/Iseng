//
//  HeatConversionViewController.swift
//  WorldTrotter
//
//  Created by Adhitya Surya Pratama on 8/25/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit

class HeatConversionViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var celciusLabel: UILabel!
    
    @IBOutlet weak var txtFahrenheit: UITextField!
    
    var fahrenheitDegree : Double?{
        didSet{
            updateCelcius()
        }
    }
    
    var celciusDegree : Double? {
        if let val = fahrenheitDegree{
            return (val - 32) * 5/9
        }
        else{
            return nil
        }
    }
    
    let numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    @IBAction func fToC(_ sender: UITextField) {
        //print(sender.text)
        if let text = sender.text, let val = Double(text) {
            fahrenheitDegree = val
        }
        else{
            fahrenheitDegree = nil
        }
    }
    @IBAction func dismissKey(_ sender: Any) {
        txtFahrenheit.resignFirstResponder()
    }
    func updateCelcius(){
        if let val = celciusDegree{
            celciusLabel.text = numberFormatter.string(for: val)
        }
        else{
            celciusLabel.text = "???"
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //print("current text : \(textField.text)")
        //print("Replacement String : \(string)")
        //return true
        let currentText = textField.text?.range(of: ".")
        let replacementString = string.range(of:".")
        let char = NSCharacterSet.letters
        let range = string.rangeOfCharacter(from: char)
        
        if currentText != nil && replacementString != nil || range != nil{
            return false
        }
        else{
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("convert")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date = Calendar.current.component(.hour, from: Date())
        switch date{
        case 17..<22: self.view.backgroundColor = UIColor.darkGray
        default:
            self.view.backgroundColor = UIColor.white
        }
    }
    
}
