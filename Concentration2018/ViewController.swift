//
//  ViewController.swift
//  Concentration2018
//
//  Created by MAC on 1/1/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
   
    
    var flipCount = 0 {
        didSet {
            
            flipCountLabel.text = "Flips: \(flipCount)"
        }
        
    }
    
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
         
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
        }
        
        else {
            
        }
    }
    
    
    func updateViewFromModel() {
        
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isfacedUp {
                button.setTitle(emoji(for: card), for: .normal)
                
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                    
                    button.setTitle("", for: .normal)
                    
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emoji = [Int : String]()
    
     var emojiChoices = ["👻", "🦐", "🍒", "🐃", "🐊", "👮🏻‍♂️", "👿", "🤩", "🤪"]
    
    func emoji(for card: Card) -> String {
    
        if emoji[card.identifier] == nil {
            
            if emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        }
      
            return emoji[card.identifier] ?? "?"
       
    }
   
}

