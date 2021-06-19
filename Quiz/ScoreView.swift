//
//  ScoreView.swift
//  Quiz
//
//  Created by YJ Soon on 12/6/21.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalScore: Int
    
    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                Text("Your score was:")
                    .font(.system(size: 16, weight: .bold))
                Text("\(score)/\(totalScore)")
                    .font(.system(size: 18, weight: .bold))
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 15, totalScore: 20)
    }
}
