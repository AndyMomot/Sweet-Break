//
//  TodayFeelingQuestionView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct TodayFeelingQuestionView: View {
    var action: (Bool) -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("How are you feeling today?")
                .foregroundStyle(.deepOrchid)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
            
            HStack(spacing: 14) {
                button(image: "hand.thumbsup",
                       title: "GOOD") {
                    action(true)
                }
                
                button(image: "hand.thumbsdown",
                       title: "BAD") {
                    action(false)
                }
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

private extension TodayFeelingQuestionView {
    func button(image: String, title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            ZStack {
                LinearGradient(
                    colors: [.pinkOrchid, .deepPlum],
                    startPoint: .top,
                    endPoint: .bottom)
                
                VStack(spacing: 8) {
                    Image(systemName: image)
                    Text(title)
                }
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                .padding(8)
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        LinearGradient(
                            colors: [.deepPlum, .pinkOrchid],
                            startPoint: .top,
                            endPoint: .bottom),
                        lineWidth: 2)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ScrollView {
        TodayFeelingQuestionView() {_ in}
            .padding()
    }
}
