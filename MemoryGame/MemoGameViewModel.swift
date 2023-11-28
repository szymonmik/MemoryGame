//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import SwiftUI

class MemoGameViewModel: ObservableObject{
    private static let EmojiArrPeople: [String] = ["👮‍♀️", "🧑‍🍳", "👨‍🏫", "👨‍🚀"]
    private static let EmojiArrFlags: [String] = ["🇵🇱", "🇷🇴", "🇵🇪", "🇳🇴", "🇪🇸", "🇱🇹" ]
    private static let EmojiArrAnimals: [String] = ["🦊", "🐸", "🐖", "🐳", "🐴", "🐁", "🦨", "🐝"]
    
    static func createGameModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: currentEmojis.count) { index in
            if(currentEmojis.indices.contains(index)){
                return currentEmojis[index]
            } 
            else
            {
                return "❓"
            }
        }
    }
    
    private static var currentEmojis = EmojiArrPeople
    
    @Published var model = createGameModel()
    
    private var themeNumber = 1
    private(set) var themeColor = Color.red
    
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func changeTheme(theme: Int){
        themeNumber = theme
        if(theme == 1){
            themeColor = Color.red
            MemoGameViewModel.currentEmojis = MemoGameViewModel.EmojiArrPeople
        } else if(theme == 2){
            themeColor = Color.blue
            MemoGameViewModel.currentEmojis = MemoGameViewModel.EmojiArrFlags
        } else if(theme == 3){
            themeColor = Color.green
            MemoGameViewModel.currentEmojis = MemoGameViewModel.EmojiArrAnimals
        }
        model = MemoGameViewModel.createGameModel()
    }
}
