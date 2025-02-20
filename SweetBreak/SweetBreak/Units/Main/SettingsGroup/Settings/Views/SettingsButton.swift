//
//  SettingsButton.swift
//  SweetBreak
//
//  Created by Andrii Momot on 20.02.2025.
//

import SwiftUI

struct SettingsButton: View {
    var imageName: String
    var title: String
    var subtitle: String?
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 16) {
                Image(imageName)
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .foregroundStyle(.darkPurple)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                    
                    if let subtitle {
                        Text(subtitle)
                            .foregroundStyle(.deepOrchid)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                            
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.darkPurple)
            }
        }
    }
}

#Preview {
    VStack {
        SettingsButton(
            imageName: Asset.profileSB.name,
            title: "Anton",
            subtitle: "tonysport3") {}
        
        SettingsButton(
            imageName: Asset.documentSB.name,
            title: "Terms of Service") {}
    }
    .padding()
}
