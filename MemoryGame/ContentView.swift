//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    var emojiArray: [String] = ["⚽️", "🚗", "🐖", "🌝"]
    var cardNumber: Int = 4
    @State var emoji: String = "😂"
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(emojiArray, id: \.self) {
                    CardView(flipped: false, text: $0)
                }
            }
        }
        .padding()
        Spacer()
        HStack{
            Button("-"){

            }.padding().border(Color.blue)
            Spacer()
            Button("+"){
                
            }.padding().border(Color.blue)
        }
        
    }
    
    
    
}

#Preview {
    ContentView()
}
