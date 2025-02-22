import SwiftUI

struct CustomLinearProgressView: View {
    let progress: CGFloat
    var backgroundColor: Color = .clear
    var progressColor: Color = .blue
    var height: CGFloat = 8
    var cornerRadius: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: geometry.size.width, height: height)
                    .foregroundColor(backgroundColor)
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: max(0, min((progress * geometry.size.width) - 10, geometry.size.width)),
                        height: height
                    )
                    .foregroundColor(progressColor)
            }
        }
        .frame(height: height)
    }
}

#Preview {
    ZStack {
        Color.gray
        CustomLinearProgressView(progress: 0.5)
            .padding()
    }
}

