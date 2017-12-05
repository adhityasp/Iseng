//
//  ViewController.swift
//  Quiz
//
//  Created by Adhitya Surya Pratama on 8/16/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let questionList : [String] = ["Who are you ?",
                                   "What's your name ?",
                                   "What is your hobby ?",
                                   ]
    
    let answerList : [String] = ["Human",
                                 "Adhitya Surya Pratama",
                                 "Listening to the music",
                                 ]
    var index : Int  = 0
    

    @IBAction func showNextQuestion(_ sender: Any) {
        index += 1
        if(index >= questionList.count){
            index=0
        }
        questionLabel.text = questionList[index]
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = answerList[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionList[index]
    }
}

