//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var scoreLabel: UILabel!            // Score ui code
    @IBOutlet weak var questionLabel: UILabel!         // Question ui code
    @IBOutlet weak var progressBar: UIProgressView!    // progress Bar ui code
    @IBOutlet weak var option_A_Button: UIButton!      // optionA ui code
    @IBOutlet weak var option_B_Button: UIButton!      // optionB ui code
    @IBOutlet weak var option_C_Button: UIButton!      // optionC ui code
    
    // object of quizBrain Struct formed in "Quizbrain.swift"
    var QuizBrain = quizBrain()
    
    // execute in the start of when app load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // func
        UpdateUI()
    }
    

    // option A,B,C Button
    @IBAction func answerButtonPressed(_ sender: UIButton){
        
        // save the clicked option button text
        let userAnswer = sender.currentTitle!
        
        // func from the "QuizBrain" that compare clicked button text with the correct text and return in Bool true/False
        let userOption = QuizBrain.checkAnswer(answer: userAnswer)
        
        // true
        if(userOption){
            
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = 20
        }
        // false
        else{
            sender.backgroundColor = UIColor.red
            sender.layer.cornerRadius = 20
        }
        
        // change the question by addition by 1, and repeat the question
        QuizBrain.changeQuestion()
        
        // this is used to reduce time of red and green colour of button and then execute the UpdateUI()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
    }
    

    @objc func UpdateUI(){
        
        // display the question ui text
        questionLabel.text = QuizBrain.displayText()
        
        // for the displaying of the option button text
        let answerchoice = QuizBrain.optionSelection()
        option_A_Button.setTitle(answerchoice[0], for: .normal)
        option_B_Button.setTitle(answerchoice[1], for: .normal)
        option_C_Button.setTitle(answerchoice[2], for: .normal)
        
        // make the option button colour clear
        option_A_Button.backgroundColor = UIColor.clear
        option_B_Button.backgroundColor = UIColor.clear
        option_C_Button.backgroundColor = UIColor.clear
        
        // diplay the score number by the func used in the "QuizBrain.swift"
        scoreLabel.text = "Score \(QuizBrain.getscore())"
        
        // diplay the progressbar  by the func used in the "QuizBrain.swift"
        progressBar.progress = QuizBrain.barProgress()
    }

}

