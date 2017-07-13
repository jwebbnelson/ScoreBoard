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

    // NSUSERDEFAULTS
    private static let PlayersKey = "players" // Key to retrieve from NSUserDefaults
    
    // SharedInstance makes certain there is only one ScoreController
    // This way we don't have any errors in our data
    static let sharedInstance = ScoreController()
    
    
    // NSUSERDEFAULTS *** UPDATE ***
    // Now we are pulling from memory we change the way "Players" is initiated
    private(set) var players = [Player]()
    
    // Function called when we start the app (ScoreController created)
    init() {

        // NSUSERDEFAULTS
        loadFromPersistentStorage()
    }
    
    // Creates a new player and adds it to the list of Players
    // Param: takes in a player's name
    func createNewPlayer(name:String) {
        let player = Player(name: name)
        players.append(player)
        // NSUSERDEFAULTS
        saveToPersistentStorage()
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
            // NSUSERDEFAULTS
            saveToPersistentStorage()
        }
    }
    
    // Removes a player from the list of players
    // Param: takes in the player to be removed
    func removePlayer(player:Player) {
        
        // Find where the player is in the list
        if let index = players.index(of: player) {
            players.remove(at: index)
            // NSUSERDEFAULTS
            saveToPersistentStorage()
        }
    }
    
    
    
    //MARK: -  NSUserDefaults
    
    // NSUSERDEFAULTS
    // Retrieve players from memory
    private func loadFromPersistentStorage() {
        let playerDictionariesFromDefaults = UserDefaults.standard.object(forKey: ScoreController.PlayersKey) as? [[String : Any]]
        if let playerDictionaries = playerDictionariesFromDefaults {
            for player in playerDictionaries {
                if let player = Player(dictionary: player) {
                    players.append(player)
                }
            }
        }
    }
    
    // NSUSERDEFAULTS
    // Save players to memory
    private func saveToPersistentStorage() {
        // * Creates an array of Player dictionaries using "map"
        let playerDictionaries = players.map { $0.dictionaryRepresentation() }
        UserDefaults.standard.set(playerDictionaries, forKey: ScoreController.PlayersKey)
    }
    
    
}
