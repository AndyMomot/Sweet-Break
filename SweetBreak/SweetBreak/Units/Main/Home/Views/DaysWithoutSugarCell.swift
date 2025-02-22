//
//  DaysWithoutSugarCell.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct DaysWithoutSugarCell: View {
    var day: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 1) {
                if day > 1 {
                    line
                }
                
                Asset.cup.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                
                line
            }
            
            Text("\(day) \(day > 1 ? "days" : "day")")
                .foregroundStyle(.darkPurple)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 2)
            
            Text("0g")
                .foregroundStyle(.deepOrchid)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
        }
    }
}

private extension DaysWithoutSugarCell {
    var line: some View {
        Rectangle()
            .fill(.deepOrchid.opacity(0.5))
            .frame(width: 22, height: 2)
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack(spacing: 0) {
            DaysWithoutSugarCell(day: 1)
            DaysWithoutSugarCell(day: 2)
            DaysWithoutSugarCell(day: 3)
            DaysWithoutSugarCell(day: 4)
            DaysWithoutSugarCell(day: 5)
        }
        .padding()
    }
}
