//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Shahzeb Khan on 08.08.25.

struct quizBrain {
    let quiz = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                 Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                 Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                 Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                 Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                 Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                 Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                 Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                 Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                 Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
 ]
    
    
    var score = 0
    var questionNumber = 0
    
    
    // check for if the user answer is true and false
    mutating func checkAnswer(answer: String)-> Bool{
        
        if (answer == quiz[questionNumber].answer){
            // true
            score += 1
            return true
            
        }else{
            //false
            return false
        }
    }
    
    // it return the options of the array
    func optionSelection() -> [String]{
        return quiz[questionNumber].options
    }
    
    // it return the score number
    func getscore() -> Int {
        return score
    }
    
    
    // it return the text for the question
    func displayText() -> String{
        
        return quiz[questionNumber].text
    }
    
    
    // return the float for the progress bar
    func barProgress() -> Float{
        
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    
    // it increase the number by 1 for the increase of array, and when the array is finished then again start from 0
    mutating func changeQuestion(){
       
        if (questionNumber + 1 < quiz.count){
            questionNumber += 1
        }
        
        else{
            questionNumber = 0
            score = 0
        }
    }
    
    
    
   
    
   
}
