//
//  AddNoteViewModel.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import Foundation

extension AddNoteView {
    final class ViewModel: ObservableObject {
        var viewState: AddNoteView.ViewState = .add {
            didSet {
                Task { await onSet() }
            }
        }
        
        @Published var title = ""
        @Published var text = ""
        let priorities = Note.Priority.allCases
        @Published var selectedPriority: Note.Priority = .low
    }
}

extension AddNoteView.ViewModel {
    func onNext() async {
        switch viewState {
        case .add:
            let note = Note(
                title: title,
                text: text,
                priority: selectedPriority
            )
            
            DefaultsService.shared.notes.append(note)
            
        case .edit(let note):
            DefaultsService.shared.notes.removeAll(where: { $0.id == note.id })
        }
    }
}

private extension AddNoteView.ViewModel {
    func onSet() async {
        switch viewState {
        case .add:
            break
        case .edit(let note):
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.title = note.title
                self.text = note.text
                self.selectedPriority = note.priority
            }
        }
    }
}

extension AddNoteView {
    enum ViewState {
        case add
        case edit(note: Note)
        
        var title: String {
            switch self {
            case .add:
                return "Adding"
            case .edit:
                return "Details"
            }
        }
        
        var next: String {
            switch self {
            case .add:
                return "Save"
            case .edit:
                return "Delete"
            }
        }
    }
}
