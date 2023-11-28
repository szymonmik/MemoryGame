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
        for i in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: "(\(i)a"))
            cards.append(Card(content: content, id: "(\(i)b"))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable{
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.isFlipped == rhs.isFlipped &&
            lhs.isMatched == rhs.isMatched &&
            lhs.content == rhs.content
        }
        
        var id: String
        
        var isFlipped: Bool = true
        var isMatched: Bool = false
        var content: CardContent

        init(content: CardContent, id: String) {
            self.content = content
            self.id = id
        }
    }

}
