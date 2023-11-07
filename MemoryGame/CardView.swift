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
    
    var body: some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 10).fill(Color(.blue))
                    .font(.largeTitle)
                    .background(flipped ? Color(.white.opacity(0.1)) : Color(.blue))
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
    CardView(text: "😂")
}
