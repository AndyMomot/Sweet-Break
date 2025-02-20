//
//  PreloaderView.swift
//  Libarorent
//
//  Created by Andrii Momot on 06.10.2024.
//

import SwiftUI

struct PreloaderView: View {
    
    var onDidLoad: () -> Void
    @State private var opacity: Double = 1.0
    
    var body: some View {
        ZStack {
            Asset.splashSecond.swiftUIImage
                .resizable()
                .ignoresSafeArea()
                
            VStack {
                Spacer()
                Asset.sugar.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .opacity(opacity)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.linear(duration: 1)) {
                    opacity = 0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                onDidLoad()
            }
        }
    }
}

#Preview {
    PreloaderView {}
}
