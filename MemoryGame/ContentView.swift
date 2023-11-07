//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    var emojiArray: [String] = ["⚽️", "🚗", "🐖", "🌝", "🎃", "💊", "🤡", "🐝", "🐤", "🐽"]
    @State var cardNumber: Int = 2
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                    ForEach(0..<cardNumber, id: \.self) { i in
                        CardView(text: emojiArray[i])
                    }
                }
            }
        }
        .padding()
        Spacer()
        HStack{
            adjustCardNumber(by: -2, symbol: "-").padding().border(Color.blue)
            Spacer()
            adjustCardNumber(by: +2, symbol: "+").padding().border(Color.blue)
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardNumber += offset
        }, label: {
            Text(symbol)
        }).disabled(cardNumber + offset < 2 || cardNumber + offset > emojiArray.count)
        
    }
    
}
               

#Preview {
    ContentView()
}
