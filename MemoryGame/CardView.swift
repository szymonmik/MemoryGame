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
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 10).fill(Color(cardColor))
                    .font(.largeTitle)
                    .background(card.isFlipped ? Color(.white.opacity(0.1)) : Color(cardColor))
                    .cornerRadius(12)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .opacity(card.isFlipped ? 1 : 0)
            }
        }
    }
    
    
}

/*
#Preview {
    CardView(text: "😂", cardColor: .red)
}
*/
