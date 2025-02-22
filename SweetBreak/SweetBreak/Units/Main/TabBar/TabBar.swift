import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = ViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            TabView(selection: $viewModel.selection) {
                HomeView()
                    .tag(TabBarSelectionView.home.rawValue)
                
                TipsView()
                    .tag(TabBarSelectionView.tips.rawValue)
                
                NotesView()
                    .tag(TabBarSelectionView.notes.rawValue)
                
                SettingsView()
                    .tag(TabBarSelectionView.settings.rawValue)
                    .environmentObject(viewModel)
            }
            
            if viewModel.isShowTabBar {
                TabBarCustomView(selectedItem: $viewModel.selection)
                    .frame(height: UIScreen.main.bounds.height * 0.12)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TabBar()
}
