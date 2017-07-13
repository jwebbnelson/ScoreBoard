//
//  Player.swift
//  Scoreboard
//
//  Created by Jordan Nelson on 7/13/17.
//  Copyright © 2017 VisionTech. All rights reserved.
//

import Foundation


// Conforms to Equatable Protocol
// This allows us to see if one Player == another Player
// * We use this to update them from our list of Players
class Player: Equatable {
    
    // NSUserDefaults
    // Keys to get details from NSUserDefaults (prevents typos)
    private static let NameKey = "name"
    private static let ScoreKey = "score"
    
    // Player variables
    var name: String
    var score: Int
    
    // Function called when creating a player
    init(name:String) {
        self.name = name
        self.score = 0 // Score begins at 0
    }
    
    // NSUserDefaults
    // Function called when retrieving a player from memory
    init?(dictionary: [String : Any]) {
        guard let name = dictionary[Player.NameKey] as? String,
            let score = dictionary["score"] as? Int else {
                // Init failed, just set details to empty player
                self.name = ""
                self.score = 0
                
                return nil
        }
        
        self.name = name
        self.score = score
    }
    
    // NSUserDefaults
    // Must convert a player to a dictionary in order to save
    func dictionaryRepresentation() -> [String : Any] {
        return [
            Player.NameKey : self.name,
            Player.ScoreKey : self.score
        ]
    }
    
}

// Equatable Protocol
func == (lhs: Player, rhs: Player) -> Bool {
    // This just means we use the Player's name to make sure they are not the same
    // * In a real app we would use more details to make sure they are not identical
    // * In the meantime, just make sure the kids give nicknames to people with the same name
    return (lhs.name == rhs.name)
}
