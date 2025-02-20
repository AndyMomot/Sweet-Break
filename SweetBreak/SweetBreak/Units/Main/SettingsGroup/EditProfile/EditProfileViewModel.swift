//
//  EditProfileViewModel.swift
//  SweetBreak
//
//  Created by Andrii Momot on 20.02.2025.
//

import UIKit.UIImage

extension EditProfileView {
    final class ViewModel: ObservableObject {
        @Published var image = Asset.logo.image
        @Published var name = ""
        @Published var nickname = ""
        
        @Published var showImagePicker = false
    }
}

extension EditProfileView.ViewModel {
    func getUser() async {
        guard let user = DefaultsService.shared.user else { return }
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.name = user.name
            self.nickname = user.nickname
        }
        
        if let imageData = await FileManagerService().fetchImage(with: user.id),
           let uiImage = UIImage(data: imageData) {
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.image = uiImage
            }
        }
    }
    
    func save() async -> Bool {
        let shared = DefaultsService.shared
        
        if var user = shared.user {
            user.name = name
            user.nickname = nickname
            shared.user = user
            await updateImage(forId: user.id)
            return true
        } else {
            let user = User(name: name, nickname: nickname)
            shared.user = user
            await updateImage(forId: user.id)
            return true
        }
    }
    
    func updateImage(forId id: String) async {
        if image == Asset.logo.image {
            FileManagerService().removeImage(with: id)
        } else {
            guard let imageData = image.pngData() else { return }
            FileManagerService().saveImage(data: imageData, for: id)
        }
    }
}
