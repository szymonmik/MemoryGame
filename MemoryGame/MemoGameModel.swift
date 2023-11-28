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
            cards.append(Card(content: content, id: "\(i)a"))
            cards.append(Card(content: content, id: "\(i)b"))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var flippedCards = [Int]()
            for index in cards.indices{
                if cards[index].isFlipped{
                    flippedCards.append(index)
                }
            }
            if flippedCards.count == 1{
                return flippedCards.first
            } else{
                return nil
            }
        }
        
        set{
            for index in cards.indices{
                if index == newValue{
                    cards[index].isFlipped = true
                } else{
                    cards[index].isFlipped = false
                }
            }
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenCardIndex = cards.firstIndex(where: { $0.id == card.id }){
            if !cards[chosenCardIndex].isFlipped && !cards[chosenCardIndex].isMatched{
                if let secondCardIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[chosenCardIndex].content == cards[secondCardIndex].content{
                        cards[chosenCardIndex].isMatched = true
                        cards[secondCardIndex].isMatched = true
                    }
                } else{
                    indexOfOneAndOnlyFaceUpCard = chosenCardIndex
                }
                cards[chosenCardIndex].isFlipped = true
            }
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
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
        
        var isFlipped: Bool = false
        var isMatched: Bool = false
        var content: CardContent

        init(content: CardContent, id: String) {
            self.content = content
            self.id = id
        }
    }

}
