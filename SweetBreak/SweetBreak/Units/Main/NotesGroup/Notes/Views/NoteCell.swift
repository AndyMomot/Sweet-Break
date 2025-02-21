//
//  NoteCell.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import SwiftUI

struct NoteCell: View {
    let note: Note
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(note.title)
                    .foregroundStyle(.deepOrchid)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                
                Text(note.text)
                    .foregroundStyle(.darkPurple)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
            }
            .lineLimit(2)
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .foregroundStyle(.deepOrchid)
        }
        .padding()
        .background(.softLilac)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.deepOrchid, lineWidth: 2)
        }
        .padding(2)
    }
}

#Preview {
    NoteCell(note: .init(
        title: "Sugar is harmful",
        text: "Yesterday there was a lecture on this topic and I realized that sugar is very harmful.",
        priority: .high
    ))
    .padding()
}
