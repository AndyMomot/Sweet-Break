import SwiftUI

struct CustomTextField: View {
    var title: String = ""
    var placeholder: String = ""
    var isDynamic = false
    var showPencil = false
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !title.isEmpty {
                Text(title)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                    .foregroundStyle(.white)
            }
            
            if isDynamic {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .scrollContentBackground(.hidden)
                        .foregroundStyle(.deepOrchid)
                        .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 16))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 28)
                        .keyboardType(keyboardType)
                    
                    if text.isEmpty {
                        createPlaceholder(text: placeholder,
                                          isDynamic: isDynamic)
                    }
                }
                .background(.softLilac)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
            } else {
                HStack {
                    TextField(text: $text) {
                        createPlaceholder(text: placeholder,
                                          isDynamic: isDynamic)
                    }
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 16))
                    .keyboardType(keyboardType)
                    
                    if showPencil {
                        Image(systemName: "pencil")
                    }
                }
                .foregroundStyle(.deepOrchid)
                .padding(.horizontal, 30)
                .padding(.vertical)
                .background(.softLilac)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .hideKeyboardWhenTappedAround()
        .padding(.horizontal, 4)
    }
}

private extension CustomTextField {
    func createPlaceholder(text: String, isDynamic: Bool) -> some View {
        return Text(text)
            .font(Fonts.SFProDisplay.lightItalic.swiftUIFont(size: 16))
            .foregroundStyle(.deepOrchid)
            .padding(.horizontal, isDynamic ? 16 : 0)
            .padding(.vertical, isDynamic ? 30 : 0)
            .allowsHitTesting(false)
    }
}

#Preview {
    ZStack {
        Asset.background.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        ScrollView {
            VStack(spacing: 20) {
                CustomTextField(placeholder: "placeholder",
                                showPencil: true,
                                text: .constant("Some text"))
                
                CustomTextField(title: "Title",
                                placeholder: "placeholder",
                                isDynamic: true,
                                text: .constant(""))
                .frame(minHeight: 300)
            }
            .padding()
        }
    }
}
