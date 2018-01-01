//
//  Concentration.swift
//  Concentration2018
//
//  Created by MAC on 1/1/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            
            if let matchindex = indexOfOneAndOnlyFacedUp, matchindex != index {
                 //check if card match
                
                if cards[matchindex].identifier == cards[index].identifier {
                    
                    cards[matchindex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isfacedUp = true
                indexOfOneAndOnlyFacedUp = nil
                
            }
            else {
                // either no cards or 2 cards are faced up
                for flipDownIndex in cards.indices {
                    
                    cards[flipDownIndex].isfacedUp = false
            }
                cards[index].isfacedUp = true
                
                indexOfOneAndOnlyFacedUp = index
        }
       
    }
    }
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
   
            
            cards += [card, card]
            
        }
        
        //TODO : shuffle the cards
        
    }
    
}

