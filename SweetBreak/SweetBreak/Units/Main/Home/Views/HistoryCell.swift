//
//  HistoryCell.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct HistoryCell: View {
    let date: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 0) {
                Circle()
                    .fill(.darkPurple)
                    .frame(width: 8)
                Rectangle()
                    .fill(.deepOrchid.opacity(0.5))
                    .frame(width: 90, height: 2)
            }
            
            Text(date.toString(format: .dayOfWeekMonthDay))
                .foregroundStyle(.darkPurple)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
            
            Text("No sugar")
                .foregroundStyle(.deepOrchid)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack(spacing: .zero) {
            HistoryCell(date: .init())
            HistoryCell(date: .init().addOrSubtract(
                component: .day,
                value: 1))
            HistoryCell(date: .init().addOrSubtract(
                component: .day,
                value: 3))
            HistoryCell(date: .init().addOrSubtract(
                component: .day,
                value: 4))
            HistoryCell(date: .init().addOrSubtract(
                component: .day,
                value: 5))
        }
        .padding()
    }
}
