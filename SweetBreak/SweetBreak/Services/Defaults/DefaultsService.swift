//
//  DefaultsService.swift
//
//  Created by Andrii Momot on 16.04.2024.
//

import Foundation

final class DefaultsService {
    static let shared = DefaultsService()
    private let standard = UserDefaults.standard
    private init() {}
}

extension DefaultsService {
    func removeAll() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            standard.removePersistentDomain(forName: bundleIdentifier)
        }
    }
    
    var flow: RootContentView.ViewState {
        get {
            let name = standard.string(forKey: Keys.flow.rawValue) ?? ""
            return RootContentView.ViewState(rawValue: name) ?? .onboarding
        }
        set {
            standard.set(newValue.rawValue, forKey: Keys.flow.rawValue)
        }
    }
}
 
extension DefaultsService {
    var user: User {
        get {
            if let data = standard.data(forKey: Keys.user.rawValue),
               let user = try? JSONDecoder().decode(User.self, from: data) {
                return user
            }
            return .init(name: "Nickname")
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.set(data, forKey: Keys.user.rawValue)
            }
        }
    }
    
    var completedWorkoutTasks: [WorkoutTask] {
        get {
            if let data = standard.data(forKey: Keys.completedWorkoutTasks.rawValue),
               let items = try? JSONDecoder().decode([WorkoutTask].self, from: data) {
                return items
            }
            return []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.set(data, forKey: Keys.completedWorkoutTasks.rawValue)
            }
        }
    }
    
    var customWorkoutTasks: [WorkoutTask] {
        get {
            if let data = standard.data(forKey: Keys.customWorkoutTasks.rawValue),
               let items = try? JSONDecoder().decode([WorkoutTask].self, from: data) {
                return items
            }
            return []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.set(data, forKey: Keys.customWorkoutTasks.rawValue)
            }
        }
    }
}

// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case flow
        case user
        case completedWorkoutTasks
        case customWorkoutTasks
    }
}
