//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 14/11/2023.
//

import Foundation


struct MemoGameModel<CardContent: Equatable>{
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        for i in 0...max(2, numberOfPairsOfCards){
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: "(\(i)a"))
            cards.append(Card(content: content, id: "(\(i)b"))
        }
    }
    
    static func choose(card: CardContent){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var id: String
        
        var isFlipped: Bool = false
        var isMatch: Bool = false
        var content: CardContent

        init(content: CardContent, id: String) {
            self.content = content
            self.id = id
        }
    }

}
