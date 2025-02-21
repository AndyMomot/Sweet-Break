//
//  AddNoteView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject private var viewModel: ViewModel
    
    init(state: ViewState, viewModel: ViewModel = .init()) {
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
                                        text: $viewModel.text)
                        
                        Picker("Energy level", selection: $viewModel.selectedPriority) {
                            ForEach(viewModel.priorities, id: \.rawValue) { priority in
                                Text(priority.displayName)
                                    .tag(priority)
                            }
                        }
                        .pickerStyle(.segmented)
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
    AddNoteView(state: .add)
}

#Preview {
    AddNoteView(state: .edit(note: .init(
        title: "Sugar is harmful",
        text: "Yesterday there was a lecture on this topic and I realized that sugar is very harmful.",
        priority: .high
    )))
}
