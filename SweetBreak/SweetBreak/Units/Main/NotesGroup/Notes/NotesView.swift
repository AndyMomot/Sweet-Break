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
                                    AddNoteView(state: .edit(note: note))
                                } label: {
                                    NoteCell(note: note)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    
                    NextButton(title: "Add note") {
                        viewModel.showAddNote.toggle()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .onAppear {
                Task { await viewModel.getNotes() }
            }
            .navigationDestination(isPresented: $viewModel.showAddNote) {
                AddNoteView(state: .add)
            }
        }
    }
}

#Preview {
    NotesView()
}
