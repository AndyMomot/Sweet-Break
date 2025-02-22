//
//  TodayFeelingAnswerView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct TodayFeelingAnswerView: View {
    var answer: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Image(answer ? "greenCheck" : "warning")
            
            HStack {
                Spacer()
                Text(answer ? "Great! Another  sugar-free day!" : "Was there a breakdown? It's okay, the main thing is to keep going!")
                    .foregroundStyle(.darkPurple)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .padding()
        .background(.softLilac)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.deepOrchid, lineWidth: 2)
        }
    }
}

#Preview {
    ScrollView {
        VStack {
            TodayFeelingAnswerView(answer: true)
            TodayFeelingAnswerView(answer: false)
        }
        .padding()
    }
}
