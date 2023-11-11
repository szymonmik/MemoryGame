//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by Szymon Mikolajczuk on 07/11/2023.
//

import SwiftUI

struct ThemeButton: View {
    var text: String
    var symbol: String
    @Binding var activeEmojiArr: Array<String>
    @Binding var activeColor: Color
    let newEmojiArr: Array<String>
    let newColor: Color
    
    var body: some View {
        Button(action: {
            activeEmojiArr = newEmojiArr.shuffled()
            activeColor = newColor
        }, label: {
            VStack{
                Image(systemName: symbol).font(.largeTitle)
                Text(text)
            }.foregroundColor(activeColor)
        })
    }
}

/*
#Preview {
    ThemeButton(text: "Test", symbol: "heart.fill")
}
*/
