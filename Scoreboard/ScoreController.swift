//
//  ScoreController.swift
//  Scoreboard
//
//  Created by Jordan Nelson on 7/13/17.
//  Copyright © 2017 VisionTech. All rights reserved.
//

import Foundation

// ScoreController creates, updates, and removes players
class ScoreController {

    // SharedInstance makes certain there is only one ScoreController
    // This way we don't have any errors in our data
    static let sharedInstance = ScoreController()
    
    var players:[Player]
    
    // Function called when we start the app (ScoreController created)
    init() {
        // Sets Players to an empty array
        players = []
    }
    
    // Creates a new player and adds it to the list of Players
    // Param: takes in a player's name
    func createNewPlayer(name:String) {
        let player = Player(name: name)
        players.append(player)
    }
    
    // Updates a player's details
    // Param: takes in a player and their new name and score
    func updatePlayerScore(player: Player, name: String, score:Int) {
       
        // Find where the player is in the list
        if let index = players.index(of: player) {
            // Use index to get that specific player
            let editPlayer = players[index]
            // Update details
            editPlayer.name = name
            editPlayer.score = score
        }
    }
    
    // Removes a player from the list of players
    // Param: takes in the player to be removed
    func removePlayer(player:Player) {
        
        // Find where the player is in the list
        if let index = players.index(of: player) {
            players.remove(at: index)
        }
    }
    
}
