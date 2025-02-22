//
//  QuoteView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        VStack(spacing: 16) {
            Asset.quote.swiftUIImage
            
            Text("Quote of the day")
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                .foregroundStyle(.lightPink)
            
            HStack {
                Spacer()
                Text("After 10 days, your skin will be clearer.")
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 20))
                    .foregroundStyle(.white)
                Spacer()
            }
        }
        .multilineTextAlignment(.center)
        .padding()
        .background(.deepOrchid)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    QuoteView()
}
