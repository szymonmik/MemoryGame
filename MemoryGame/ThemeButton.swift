//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by Szymon Mikolajczuk on 07/11/2023.
//

import SwiftUI

struct ThemeButton: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    var text: String
    var symbol: String
    var theme: Int
    var color: Color = Color.blue
    
    var body: some View {
        Button(action: {
            viewModel.changeTheme(theme: theme)
            //viewModel.shuffle()
        }, label: {
            VStack{
                Image(systemName: symbol).font(.largeTitle)
                Text(text)
            }.foregroundColor(color)
        })
    }
}

/*
#Preview {
    ThemeButton(text: "Test", symbol: "heart.fill")
}
*/
