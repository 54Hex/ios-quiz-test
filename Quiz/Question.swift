//
//  Question.swift
//  Quiz
//
//  Created by YJ Soon on 12/6/21.
//

import Foundation

struct Question {
    
    var title: String
    
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    var answer: Int
    
    var maxLength: Int
    init(ques:String, opt1: String, opt2:String, opt3: String, opt4: String, ans: Int){
        title = ques
        option1 = opt1
        option2 = opt2
        option3 = opt3
        option4 = opt4
        answer = ans
        let lengths: Array<Int> = [option1.count, option2.count, option3.count, option4.count]
        maxLength = lengths.max()! * 15
    }
    
}
