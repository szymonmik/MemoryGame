//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import Foundation

class MemoGameViewModel: ObservableObject{
    private static let EmojiArrPeople: [String] = ["👮‍♀️", "🧑‍🍳", "👨‍🏫", "👨‍🚀"]
    private static let EmojiArrFlags: [String] = ["🇵🇱", "🇷🇴", "🇵🇪", "🇳🇴", "🇪🇸", "🇱🇹" ]
    private static let EmojiArrAnimals: [String] = ["🦊", "🐸", "🐖", "🐳", "🐴", "🐁", "🦨", "🐝"]
    
    static func createGameModel() -> MemoGameModel<String> {
        return MemoGameModel(numberOfPairsOfCards: 4) { index in
            if(currentEmojis.indices.contains(index)){
                return currentEmojis[index]
            } 
            else
            {
                return "??"
            }
        }
    }
    
    private static var currentEmojis = EmojiArrPeople
    
    @Published var model = createGameModel()
}
