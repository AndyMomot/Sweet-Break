//
//  TipsView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import SwiftUI

struct TipsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    NavigationBarTitle(text: "Tips")
                    
                    ScrollView {
                        VStack(spacing: 32) {
                            ForEach(viewModel.tips.indices, id: \.self) { index in
                                let tip = viewModel.tips[index]
                                NavigationLink {
                                    TipDetailView(index: index + 1,
                                                  tip: tip)
                                } label: {
                                    TipCell(item: tip)
                                }
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
}

#Preview {
    TipsView()
}
