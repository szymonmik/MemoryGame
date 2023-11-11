//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var themeColor: Color = .red
    @State var emojiArr: [String] = ["👮‍♀️", "👮‍♀️", "🧑‍🍳", "🧑‍🍳", "👨‍🏫", "👨‍🏫", "👨‍🚀", "👨‍🚀"]
    let EmojiArrPeople: [String] = ["👮‍♀️", "👮‍♀️", "🧑‍🍳", "🧑‍🍳", "👨‍🏫", "👨‍🏫", "👨‍🚀", "👨‍🚀"]
    let EmojiArrFlags: [String] = ["🇵🇱", "🇵🇱", "🇷🇴", "🇷🇴", "🇵🇪", "🇵🇪", "🇳🇴", "🇳🇴", "🇪🇸", "🇪🇸", "🇱🇹", "🇱🇹", "🇯🇵", "🇯🇵", "🇫🇮", "🇫🇮"]
    let EmojiArrAnimals: [String] = ["🦊", "🦊", "🐸", "🐸", "🐖", "🐖", "🐳", "🐳", "🐴", "🐴", "🐁", "🐁", "🦨", "🦨", "🐝", "🐝", "🐤", "🐤", "🐽", "🐽"]
    @State var cardNumber: Int = 4
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView {
                Cards
            }
        }
        .padding()
        Spacer()
        
        ThemeButtons
        
        /*HStack{
            adjustCardNumber(by: -2, symbol: "-").padding().border(Color.blue)
            Spacer()
            adjustCardNumber(by: +2, symbol: "+").padding().border(Color.blue)
        }*/
    }
    
    /*func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardNumber += offset
        }, label: {
            Text(symbol)
        }).disabled(cardNumber + offset < 2 || cardNumber + offset > emojiArray.count)
    }*/
    
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            ForEach(0..<emojiArr.count, id: \.self) { i in
                CardView(text: emojiArr[i], cardColor: themeColor)
                    .aspectRatio(2/3, contentMode: .fit)
                    
            }
        }.foregroundColor(themeColor)
    }
    
    var ThemeButtons: some View {
        HStack{
            Spacer()
            ThemeButton(text: "People", symbol: "face.smiling", activeEmojiArr: $emojiArr, activeColor: $themeColor, newEmojiArr: EmojiArrPeople, newColor: .red)
            Spacer()
            ThemeButton(text: "Flags", symbol: "ant.circle", activeEmojiArr: $emojiArr, activeColor: $themeColor, newEmojiArr: EmojiArrFlags, newColor: .blue)
            Spacer()
            ThemeButton(text: "Animals", symbol: "cat.circle", activeEmojiArr: $emojiArr, activeColor: $themeColor, newEmojiArr: EmojiArrAnimals, newColor: .green)
            Spacer()
        }
    }
    
}
               

#Preview {
    ContentView()
}
