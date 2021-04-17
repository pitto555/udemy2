//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var bar: UIProgressView!
    @IBOutlet private weak var rueButton: UIButton!
    @IBOutlet private weak var falseButton: UIButton!
    
   
    var quizBrain = QuizBrain()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       updateUI()
        
    }

    @IBAction func answerButton(_ sender: UIButton) {
        //ユーザーの答え
        let userAnswer = sender.currentTitle!
        //ユーザーの答えをquizBrain()に渡してる
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        //userGotItRightはfunc checkAnswerによってBool型で返される。trueかfalseが返ってくる。
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuizText()
        //進行状況
        bar.progress = quizBrain.getProgress()
        
        rueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

