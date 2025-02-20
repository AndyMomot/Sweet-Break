//
//  EditProfileView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 20.02.2025.
//

import SwiftUI

struct EditProfileView: View {
    var onDismiss: () -> Void
    
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) private var dismiss
    private var bounds: CGRect { UIScreen.main.bounds }
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                BackButton(title: "Profile edit")
                
                Image(uiImage: viewModel.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: bounds.width * 0.5,
                           height: bounds.width * 0.5)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.deepOrchid, lineWidth: 6)
                    }
                    .onTapGesture {
                        viewModel.showImagePicker.toggle()
                    }
                    .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    withAnimation {
                                        viewModel.image = Asset.logo.image
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundStyle(.white)
                                        .padding()
                                        .background(.deepOrchid)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                
                ScrollView {
                    VStack(spacing: 16) {
                        CustomTextField(placeholder: "Name",
                                        text: $viewModel.name)
                        
                        CustomTextField(placeholder: "Nickname",
                                        text: $viewModel.nickname)
                    }
                }
                .scrollIndicators(.never)
                
                NextButton(title: "Save") {
                    Task {
                        if await viewModel.save() {
                            onDismiss()
                            dismiss.callAsFunction()
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .onAppear {
            Task { await viewModel.getUser() }
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.image)
        }
    }
}

#Preview {
    EditProfileView {}
}
