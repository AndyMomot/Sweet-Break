import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = ViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            TabView(selection: $viewModel.selection) {
                Text("Home")
                    .tag(TabBarSelectionView.home.rawValue)
                    .environmentObject(viewModel)
                
                Text("Tips")
                    .tag(TabBarSelectionView.tips.rawValue)
                    .environmentObject(viewModel)
                
                Text("Notes")
                    .tag(TabBarSelectionView.notes.rawValue)
                    .environmentObject(viewModel)
                
                SettingsView()
                    .tag(TabBarSelectionView.settings.rawValue)
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
