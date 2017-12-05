//
//  CalculatorModel.swift
//  CalculatorSwift
//
//  Created by Adhitya Surya Pratama on 5/6/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import Foundation

struct CalculatorModel{
    var resultIsPending : Bool?
    var description : String?
    private enum OperationTypes{
        case constant(Double)
        case unaryOperation((Double)->Double)//tipe function double-> return double
        case binaryOperation((Double,Double)->Double)
        case equals
    }
    private var dictionaryOperation : Dictionary<String, OperationTypes> = [
        "π" : OperationTypes.constant(Double.pi),
        "√" : OperationTypes.unaryOperation(sqrt),
       // "e" : OperationTypes.constant(M_E),
        "cos"   :OperationTypes.unaryOperation(cos),
        //closure (function embeded write inline)
        "±" : OperationTypes.unaryOperation({-$0}),
        "+" :OperationTypes.binaryOperation({$0 + $1}),
        "−" :OperationTypes.binaryOperation({$0 - $1}),
        "×" :OperationTypes.binaryOperation({$0 * $1}),
        "÷" :OperationTypes.binaryOperation({$0 / $1}),
        "=" :OperationTypes.equals
        ]
    var accumulator:Double?
    mutating func setOperand(_ operand:Double){
        accumulator = operand
    }
    private var waitForAnotherOperation: WaitForAnotherOperation?
    mutating func operation(_ operationSymbol:String){
        if let operations = dictionaryOperation[operationSymbol] {
            switch operations {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if(accumulator != nil){
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil{
                    waitForAnotherOperation = WaitForAnotherOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                if(accumulator != nil && waitForAnotherOperation != nil){
                    accumulator =  waitForAnotherOperation?.performOperation(accumulator!)
                    waitForAnotherOperation = nil
                }
            }
        }
    }
    private struct WaitForAnotherOperation{
        let function:(Double,Double)->Double
        let firstOperand:Double
        
        func performOperation(_ secondOperand:Double) -> Double{
            return function(firstOperand,secondOperand)
        }
    }
    var result : Double?{
        get{
            return accumulator
        }
    }
}
