//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    let card: MemoGameModel<String>.Card
    let cardColor: Color
    
    var body: some View {
        CirclePart(startAngle: .degrees(-90), endAngle: .degrees(160))
            .overlay(content: {
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .opacity(card.isFlipped ? 1 : 0)
            })
            .transformIntoCard(isFlipped: card.isFlipped, cardColor: cardColor)
            .opacity(card.isFlipped || !card.isMatched ? 1 : 0)
    }
}

/*
#Preview {
    CardView(text: "😂", cardColor: .red)
}
*/
