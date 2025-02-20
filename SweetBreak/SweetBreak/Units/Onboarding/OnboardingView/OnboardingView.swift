import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.ViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                NextButton(title: item.nextButtonTitle) {
                    
                    if item.rawValue == item.lastIndex {
                        withAnimation {
                            rootViewModel.setFlow(.main)
                        }
                    } else {
                        withAnimation {
                            currentPageIndex = item.next.rawValue
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    OnboardingView(item: .third, currentPageIndex: .constant(2))
}
