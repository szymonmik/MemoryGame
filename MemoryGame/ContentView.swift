//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
        }
        .padding()
        Spacer()
        
        Button("Shuffle", action: {
            viewModel.shuffle()
        })
        .buttonStyle(.borderedProminent)
        .tint(viewModel.themeColor)
        .padding()
        ThemeButtons
        
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards) { card in
                CardView(card: card, cardColor: viewModel.themeColor)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture{
                        viewModel.choose(card)
                    }
                
                    
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    var ThemeButtons: some View {
        HStack{
            Spacer()
            ThemeButton(viewModel: viewModel, text: "People", symbol: "face.smiling", theme: 1, color: viewModel.themeColor)
            Spacer()
            ThemeButton(viewModel: viewModel, text: "Flags", symbol: "ant.circle", theme: 2, color: viewModel.themeColor)
            Spacer()
            ThemeButton(viewModel: viewModel, text: "Animals", symbol: "cat.circle", theme: 3, color: viewModel.themeColor)
            Spacer()
        }
    }
    
}
               

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
