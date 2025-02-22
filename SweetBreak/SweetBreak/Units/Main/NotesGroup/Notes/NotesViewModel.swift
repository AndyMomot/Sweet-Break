//
//  NotesViewModel.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import Foundation

extension NotesView {
    final class ViewModel: ObservableObject {
        @Published var notes = [Note]()
        @Published var showAddNote = false
    }
}

extension NotesView.ViewModel {
    func getNotes() async {
        let notes = DefaultsService.shared.notes
        await MainActor.run { [weak self] in
            self?.notes = notes
        }
    }
}


// MARK: Note -
struct Note: Codable, Identifiable {
    private(set) var id = UUID().uuidString
    var title: String
    var text: String
    var priority: Priority
}

extension Note {
    enum Priority: Int, Codable, CaseIterable {
        case low = 0
        case medium
        case high
        
        var displayName: String {
            switch self {
            case .low:
                return "LOW"
            case .medium:
                return "MEDIUM"
            case .high:
                return "HIGH"
            }
        }
    }
}
