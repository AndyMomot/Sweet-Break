//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import Foundation

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {}
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        case fourth
        
        var image: String {
            switch self {
            case .first:
                return Asset.onboard1.name
            case .second:
                return Asset.onboard2.name
            case .third:
                return Asset.onboard3.name
            case .fourth:
                return Asset.onboard4.name
            }
        }
        
        var text: String {
            switch self {
            case .first:
                return ""
            case .second:
                return ""
            case .third:
                return ""
            case .fourth:
                return ""
            }
        }
        
        var nextButtonTitle: String {
            switch self {
            case .first, .second, .third:
                return "NEXT"
            case .fourth:
                return "START!"
            }
        }

        var next: Self {
            switch self {
            case .first:
                return .second
            case .second:
                return .third
            case .fourth, .third:
                return .fourth
            }
        }
        
        var lastIndex: Int {
            OnboardingItem.allCases.last?.rawValue ?? .zero
        }
    }
}
