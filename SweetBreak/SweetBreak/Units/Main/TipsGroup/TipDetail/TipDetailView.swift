//
//  TipeDetailView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import SwiftUI

struct TipDetailView: View {
    let index: Int
    let tip: Tip
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                BackButton(title: "Tip #\(index)")
                
                ScrollView {
                    VStack(spacing: 40) {
                        Image(tip.imageName)
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(tip.title)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 18))
                                .foregroundStyle(.deepOrchid)
                            
                            Text(tip.text)
                                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                                .foregroundStyle(.darkPurple)
                        }
                    }
                    .padding(.bottom)
                }
                .scrollIndicators(.never)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TipDetailView(index: 1,
                   tip: .init(
        imageName: Asset.tip1.name,
        title: "How to recognize hidden sugar in foods?",
        text: "Sugar is often hidden under many different names, making it hard to spot. It can be labeled as syrup (like high-fructose corn syrup), glucose, dextrose, maltose, and other sweeteners. Manufacturers use these terms to make it harder for consumers to recognize the sugar content. It's essential to check the ingredients list for any of these terms, especially if they appear early in the list, which indicates higher amounts. Even foods you might not expect, like salad dressings or bread, could contain hidden sugars."
    ))
}
