//
//  NotesView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import SwiftUI

struct NotesView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    NavigationBarTitle(text: "Notes")
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.notes) { note in
                                NavigationLink {
                                    
                                } label: {
                                    NoteCell(note: note)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    
                    NextButton(title: "Add note") {
                        
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .onAppear {
                Task {
                    await viewModel.getNotes()
                }
            }
        }
    }
}

#Preview {
    NotesView()
}
