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
    
    // Player variables
    var name: String
    var score: Int
    
    // Function called when creating a player
    init(name:String) {
        self.name = name
        self.score = 0 // Score begins at 0
    }
    
}

// Equatable Protocol
func ==(lhs: Player, rhs: Player) -> Bool {
    // This just means we use the Player's name to make sure they are not the same
    // * In a real app we would use more details to make sure they are not identical
    // * In the meantime, just make sure the kids give nicknames to people with the same name
    return (lhs.name == rhs.name)
}
