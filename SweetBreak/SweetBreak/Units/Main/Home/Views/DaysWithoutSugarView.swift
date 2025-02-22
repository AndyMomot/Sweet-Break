//
//  DaysWithoutSugarView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct DaysWithoutSugarView: View {
    var progressDays: Int
    var text: String
    var showProgressBur = false
    var goal = 30
    
    @State private var progressPercent: Double = .zero
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.pinkOrchid, .deepPlum],
                startPoint: .top,
                endPoint: .bottom)
            
            VStack(spacing: 8) {
                Text("\(showProgressBur ? goal : progressDays) DAYS")
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                
                Text(text)
                    .foregroundStyle(.white.opacity(0.5))
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                
                CustomLinearProgressView(
                    progress: progressPercent,
                    backgroundColor: .softPink.opacity(0.5),
                    progressColor: .lightPink
                )
                .hidden(!showProgressBur)
            }
            .padding(.top)
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
        .padding(2)
        .onAppear {
            Task {
                await calculateProgress()
            }
        }
    }
}

private extension DaysWithoutSugarView {
    func calculateProgress() async {
        let progress = Double(progressDays) / Double(goal)
        await MainActor.run {
            self.progressPercent = progress
        }
    }
}

#Preview {
    ScrollView {
        HStack {
            DaysWithoutSugarView(
                progressDays: 7,
                text: "without sugar")
            
            DaysWithoutSugarView(
                progressDays: 7,
                text: " before the goal",
                showProgressBur: true
            )
        }
        .padding()
    }
}
