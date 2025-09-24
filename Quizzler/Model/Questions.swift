//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Shahzeb Khan on 08.08.25.


struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        options = a
        answer = correctAnswer
        
    }
}
