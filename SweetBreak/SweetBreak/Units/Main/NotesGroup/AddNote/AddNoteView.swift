//
//  AddNoteView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ViewModel
    
    init(state: ViewState,
         viewModel: ViewModel = .init()) {
        viewModel.viewState = state
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Asset.background.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                BackButton(title: viewModel.viewState.title)
                
                ScrollView {
                    VStack(spacing: 16) {
                        CustomTextField(placeholder: "Heading",
                                        text: $viewModel.title)
                        
                        CustomTextField(placeholder: "Text",
                                        isDynamic: true,
                                        text: $viewModel.text)
                        .frame(minHeight: 140)
                        
                        Picker("Energy level", selection: $viewModel.selectedPriority) {
                            ForEach(viewModel.priorities, id: \.rawValue) { priority in
                                Text(priority.displayName)
                                    .foregroundStyle(.darkPurple)
                                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                                    .tag(priority)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(10)
                        .background(.softLilac)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .scrollIndicators(.never)
                
                NextButton(title: viewModel.viewState.next) {
                    Task {
                        await viewModel.onNext()
                        dismiss.callAsFunction()
                    }
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AddNoteView(state: .add)
}

#Preview {
    AddNoteView(state: .edit(note: .init(
        title: "Sugar is harmful",
        text: "Yesterday there was a lecture on this topic and I realized that sugar is very harmful.",
        priority: .high
    )))
}
