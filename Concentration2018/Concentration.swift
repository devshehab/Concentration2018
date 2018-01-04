//
//  Concentration.swift
//  Concentration2018
//
//  Created by MAC on 1/1/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUp: Int? {
        
        get {
           return cards.indices.filter { cards[$0].isfacedUp }.oneAndOnly
       
        }
        set {
            for index in cards.indices {
                cards[index].isfacedUp = (index == newValue)
            }
        }
        
    }


    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            
            if let matchindex = indexOfOneAndOnlyFacedUp, matchindex != index {
                 //check if card match
                
                if cards[matchindex] == cards[index] {
                    
                    cards[matchindex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isfacedUp = true
      
            }
                
            else {
             
                indexOfOneAndOnlyFacedUp = index
        }
       
    }
    }
    
   
    init(numberOfPairsOfCards: Int) {
       
//        var unShuffeldCards: [Card] = []
       
        for _ in 1...numberOfPairsOfCards {
         
     let card = Card()
          
            cards += [card, card]
        }
//            TODO: Shuffle the cards
       
//        while !unShuffeldCards.isEmpty {
//
//            let randomIndex = unShuffeldCards.count.arc4Random
//
//            let card = unShuffeldCards.remove(at: randomIndex)
//
//            cards.append(card)
//        }
    }
}


extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}






