//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 05/12/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    let isFlipped: Bool
    let cardColor: Color
    
    func body(content: Content) -> some View{
        ZStack {
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 10).fill(Color(cardColor))
                    .font(.largeTitle)
                    .background(isFlipped ? Color(.white.opacity(0.1)) : Color(cardColor))
                    .cornerRadius(12)
                content
                    .opacity(isFlipped ? 1 : 0)
            }
            
        }
    }
}

extension View {
    func transformIntoCard(isFlipped: Bool, cardColor: Color) -> some View {
        modifier(TransformIntoCard(isFlipped: isFlipped, cardColor: cardColor))
    }
}

/*
#Preview {
    TransformIntoCard()
}
*/
