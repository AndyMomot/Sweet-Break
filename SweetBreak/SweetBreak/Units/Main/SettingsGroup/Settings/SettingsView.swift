//
//  SettingsView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 20.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = ViewModel()
    private var bounds: CGRect { UIScreen.main.bounds }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    NavigationBarTitle(text: "Settings")
                    
                    viewModel.userImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: bounds.width * 0.5,
                               height: bounds.width * 0.5)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.deepOrchid, lineWidth: 6)
                        }
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            SettingsButton(
                                imageName: Asset.profileSB.name,
                                title: viewModel.name,
                                subtitle: viewModel.nickname) {
                                    viewModel.showEditProfile.toggle()
                                }
                            
                            HStack {
                                Text("App")
                                    .foregroundStyle(.darkPurple)
                                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 18))
                                Spacer()
                            }
                            
                            SettingsButton(
                                imageName: Asset.documentSB.name,
                                title: "Terms of Service") {
                                    viewModel.showPrivacy.toggle()
                                }
                            
                            SettingsButton(
                                imageName: Asset.appVersionSB.name,
                                title: "Version \(viewModel.appVersion)") {
                                    if let url = viewModel.appStoreURL {
                                        UIApplication.shared.open(url)
                                    }
                                }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .padding(.horizontal)
            }
            .navigationDestination(isPresented: $viewModel.showEditProfile) {
                EditProfileView {
                    Task {
                        await viewModel.getUser()
                    }
                }
            }
            .sheet(isPresented: $viewModel.showPrivacy) {
                SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
            }
        }
        .onAppear {
            Task {
                await viewModel.getUser()
            }
        }
    }
}

#Preview {
    SettingsView()
}
