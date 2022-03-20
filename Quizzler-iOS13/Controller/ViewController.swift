//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? String()
        
        // call the check answer method from Quiz Brain Struct
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
//        if quizBrain.questionNumber + 1 < quizBrain.questionAndAnswer.count{
//            quizBrain.questionNumber += 1
//        }else{
//            quizBrain.questionNumber = 0
//        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateView), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func updateView(){
//      questionText.text = quizBrain.questionAndAnswer[quizBrain.questionNumber].text
        questionText.text = quizBrain.getQuestionText()
        scoreText.text = "Score : \(quizBrain.getScore())"
        
//      progressBar.progress = Float(quizBrain.questionNumber + 1) / Float(quizBrain.questionAndAnswer.count)
        progressBar.progress = quizBrain.getProgress()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

    }

}
