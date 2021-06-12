//
//  ContentView.swift
//  Quiz
//
//  Created by YJ Soon on 12/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertPresented = false
    @State private var isCorrect = false
    @State private var isSheetPresented = false
    @State private var quesInd = 0
    @State private var correctAnswers = 0
    
    var questions = [
        Question(ques: "What day of the week is it?", opt1: "Monday", opt2: "Saturday", opt3: "Sunday", opt4: "Wednesday", ans: 2),
        Question(ques: "What does YJ eat?", opt1: "Broccoli", opt2: "Nutella", opt3: "Rice", opt4: "MacBooks", ans:2),
        Question(ques: "Did Jia Chen sleep last night?", opt1: "Yes", opt2: "No", opt3: "idk", opt4: "Yes?", ans:2)
    ]
    
    var body: some View {
        VStack{
            
            Text(questions[quesInd].title)
                .padding()
            
            HStack {
                VStack{
                    Button(questions[quesInd].option1) { didTapOption(1)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 4).frame(width: CGFloat(questions[quesInd].maxLength), height: 40, alignment: .center))
                    Button(questions[quesInd].option2) { didTapOption(2) }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 4).frame(width: CGFloat(questions[quesInd].maxLength), height: 40, alignment: .center))
                }.padding(40)
                VStack {
                    Button(questions[quesInd].option3) { didTapOption(3) }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 4).frame(width: CGFloat(questions[quesInd].maxLength), height: 40, alignment: .center))
                    Button(questions[quesInd].option4) { didTapOption(4) }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 4).frame(width: CGFloat(questions[quesInd].maxLength), height: 40, alignment: .center))
                }.padding()
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text(isCorrect ? "Well done!" : "Boooo wrong"),
                  message: Text(isCorrect ? "Congratulations 🎉" : "Try harder please 😔"),
                  dismissButton: .default(Text("OK")){
                    quesInd += 1
                    
                    if quesInd == questions.count {
                        // We finished! Show the score sheet
                        quesInd = 0
                        isSheetPresented = true
                    }
            })
        }
        .sheet(isPresented: $isSheetPresented) {
            ScoreView(score: correctAnswers, totalScore: questions.count)
        }
    }
    
    func didTapOption(_ optionNumber: Int) {
        if optionNumber ==  questions[quesInd].answer{
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
