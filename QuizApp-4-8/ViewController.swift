//
//  ViewController.swift
//  QuizApp-4-8
//
//  Created by Shamali Patil on 04/08/2020.
//  Copyright © 2020 Shamali Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questionNumber = 0
    var score = 0
    
    var quizHnadler = QuizHandler()

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trueButton.layer.cornerRadius = trueButton.frame.height / 2
        falseButton.layer.cornerRadius = falseButton.frame.height / 2
       
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userGotCorrect = quizHnadler.checkAnswer(userAnswer: sender.currentTitle!)
        
        if userGotCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizHnadler.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        questionLabel.text = quizHnadler.getQuestionText()
        progressBar.progress = quizHnadler.setProgressBar()
        scoreLabel.text = "Score \(quizHnadler.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
}

