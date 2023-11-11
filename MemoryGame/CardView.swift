//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    @State var flipped: Bool = false
    var text: String
    let cardColor: Color
    
    var body: some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 10).fill(Color(cardColor))
                    .font(.largeTitle)
                    .background(flipped ? Color(.white.opacity(0.1)) : Color(cardColor))
                    .cornerRadius(12)
                Text(text)
                    .font(.largeTitle)
                    .opacity(flipped ? 1 : 0)
            }
            
                
        }
        .onTapGesture {
            flipped = !flipped
        }
    }
    
    
}

#Preview {
    CardView(text: "😂", cardColor: .red)
}
