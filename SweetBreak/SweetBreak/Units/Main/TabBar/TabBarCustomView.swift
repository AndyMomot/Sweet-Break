//
//  TabBarCustomView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 13.06.2024.
//

import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    private let items: [TabBar.Item] = [
        .init(
            imageName: Asset.tab1.name,
            selectedImageName: Asset.tab1s.name,
            title: "Home"
        ),
        .init(
            imageName: Asset.tab2.name,
            selectedImageName: Asset.tab2s.name,
            title: "Tips"
        ),
        .init(
            imageName: Asset.tab3.name,
            selectedImageName: Asset.tab3s.name,
            title: "Notes"
        ),
        .init(
            imageName: Asset.tab4.name,
            selectedImageName: Asset.tab4s.name,
            title: "Settings"
        ),
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.softPink)
            
            HStack(spacing: 0) {
                Spacer()
                ForEach(0..<items.count, id: \.self) { index in
                    let item = items[index]
                    let isSelected = selectedItem == index
                    
                    Button {
                        DispatchQueue.main.async {
                            withAnimation {
                                selectedItem = index
                            }
                        }
                    } label: {
                        VStack(spacing: 9) {
                            Image(isSelected ? item.selectedImageName : item.imageName)
                            
                            Text(item.title)
                                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 12))
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                        }
                        .foregroundStyle(isSelected ? .darkPurple : .deepOrchid)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
        TabBarCustomView(selectedItem: .constant(0))
            .frame(height: 105)
    }
}
