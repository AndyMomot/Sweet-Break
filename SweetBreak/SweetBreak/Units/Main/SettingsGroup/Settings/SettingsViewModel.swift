//
//  SettingsViewModel.swift
//  SweetBreak
//
//  Created by Andrii Momot on 20.02.2025.
//

import SwiftUI

extension SettingsView {
    final class ViewModel: ObservableObject {
        @Published var userImage = Asset.logo.swiftUIImage
        @Published var name = "-"
        @Published var nickname = "-"
        @Published var appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-"
        
        @Published var showEditProfile = false
        @Published var showPrivacy = false
        
        let privacyPolicyURL = URL(string: "https://google.com")
        let appStoreURL = URL(string: "https://apps.apple.com/app/id6740994248")
    }
}

extension SettingsView.ViewModel {
    func getUser() async {
        guard let user = DefaultsService.shared.user else { return }
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.name = user.name
            self.nickname = user.nickname
        }
        
        if let imageData = await FileManagerService().fetchImage(with: user.id),
           let uiImage = UIImage(data: imageData) {
            let image = Image(uiImage: uiImage)
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.userImage = image
            }
        }
    }
}
