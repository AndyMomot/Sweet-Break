import SwiftUI

struct NextButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                
                Text(title)
                    .foregroundStyle(.darkPurple)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                
                Spacer()
            }
            .padding(.vertical)
            .padding(.horizontal, 28)
            .background(.lightPink)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ZStack {
        Color.gray
        
        VStack {
            NextButton(title: "Další") {}
                .frame(height: 52)
                .padding(.horizontal)
            
            NextButton(title: "Další") {}
                .frame(height: 52)
                .padding(.horizontal)
        }
    }
}
