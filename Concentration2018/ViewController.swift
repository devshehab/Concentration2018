//
//  ViewController.swift
//  Concentration2018
//
//  Created by MAC on 1/1/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
     
            return (cardButtons.count + 1) / 2
        
        
    }
    
   
    
    private(set) var flipCount = 0 {
        didSet {
           updateFlipCountLabel()
        }
        
    }
    
    private func updateFlipCountLabel() {
        
        let attributes : [NSAttributedStringKey: Any] = [ .strokeWidth: 5.0, .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1) ]
        
        let attributeString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        
        flipCountLabel.attributedText = attributeString
        
    }
    
//    @IBOutlet private weak var newGameButt: UIButton!
    
//    @IBAction private func newGameButtonIsPressed(_ sender: UIButton) {
//
//        flipCount = 0
//
//        for index in cardButtons.indices {
//
//        let restartButton = cardButtons[index]
//
//            restartButton.setTitle("", for: .normal)
//            restartButton.backgroundColor = #colorLiteral(red: 1, green: 0.5433388929, blue: 0, alpha: 1)
//        }
//    }
    
    
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
         
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
        }
       
    }
    
    
   private func updateViewFromModel() {
        
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
    
    private var emoji = [Card : String]()
    
    private var emojiChoices = "👻🦐🍒🐃🐊👮🏻‍♂️👿🤩🤪🐰🏐⛹🏻‍♂️⛸"
    
    private func emoji(for card: Card) -> String {
    
        if emoji[card] == nil {
            
            if emojiChoices.count > 0 {
         
                let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4Random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        }
      
            return emoji[card] ?? "?"
       
    }
    
 
   
}

extension Int {
    
    var arc4Random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
          return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
    
        
    
}


