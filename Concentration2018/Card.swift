//
//  Card.swift
//  Concentration2018
//
//  Created by MAC on 1/1/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation

struct Card {
    
    var isfacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        
        self.identifier = Card.getUniqueIdentifier()
    }
}
