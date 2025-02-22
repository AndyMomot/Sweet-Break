//
//  HomeViewModel.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published var dates: [Date] = []
        @Published var canAddANewDate = true
        @Published var showAddEntryAlert = false
        
        @Published var canAskMood = false
        @Published var moodAnswer = true
        @Published var showMoodAnswerView = false
    }
}

extension HomeView.ViewModel {
    func getDates() async {
        let dates = DefaultsService.shared.daysWithoutSugar
        var canAddANewDate: Bool {
            if let lastDate = dates.last { return !lastDate.isToday() }
            return true
        }
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.dates = dates
            self.canAddANewDate = canAddANewDate
        }
    }
    
    func addNewDate() async {
        let shared = DefaultsService.shared
        if !shared.daysWithoutSugar.contains(where: { $0.isToday() }) {
            shared.daysWithoutSugar.append(.init())
            await getDates()
        }
    }
    
    func getLastMoodQuestionDate() async {
        if let lastMoodQuestionDate = DefaultsService.shared.lastMoodQuestionDate {
            let canAsk = !lastMoodQuestionDate.isToday()
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.canAskMood = canAsk
            }
        } else {
            await MainActor.run { [weak self] in
                guard let self else { return }
                self.canAskMood = true
            }
        }
    }
    
    func handleMood(answer: Bool) async {
        DefaultsService.shared.lastMoodQuestionDate = .init()
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.moodAnswer = answer
            self.canAskMood = false
            self.showMoodAnswerView = true
        }
        
        try? await Task.sleep(nanoseconds: 10_000_000_000) // 10 секунд
        
        await MainActor.run { [weak self] in
            self?.showMoodAnswerView = false
        }
    }
}
