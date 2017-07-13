//
//  HomeTableViewController.swift
//  Scoreboard
//
//  Created by Jordan Nelson on 7/13/17.
//  Copyright © 2017 VisionTech. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Called when this screen is about to become visible
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // *Make sure to call so the tableView reloads with the new updates to Players
        self.tableView.reloadData()
    }
    
    /*
     TableView asks for number of sections
     This method is REQUIRED to make a tableView
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /*
     TableView asks for number of rows in each section
     This method is REQUIRED to make a tableView
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Number of players in the ScoreController
        return ScoreController.sharedInstance.players.count
    }
    
    /*
     TableView needs to know what kind of cells to make
     This method is REQUIRED to make a tableView
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TableView will make("Dequeue") the cell with the name we gave in Storyboard
        // The TableView uses "indexPath" to keep track of each row
        let scoreCell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath)
        
        // * Make sure to set cell in storyboard to "Right detail" so you can add the score as the detail label
        
        // Get each player from Scorecontroller player list
        let player = ScoreController.sharedInstance.players[indexPath.row]
        
        // Set labels according to the player details
        scoreCell.textLabel?.text = player.name
        scoreCell.detailTextLabel?.text = "\(player.score)"
        
        return scoreCell
    }
    
    // * Method Comes partially filled when you create a new TableViewController
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Determine which player is in the row to be deleted
            let player = ScoreController.sharedInstance.players[indexPath.row]
            // Remove the player from the list
            ScoreController.sharedInstance.removePlayer(player: player)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    /*
     This function called when a segue begins
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check to see which segue was started
        if segue.identifier == "updatePlayerSegue" {
            // Update player
            
            // Figure out which cell was tapped
            // * Uses "sender" which is the object that starts the segue
            // In this case it is a cell, for the "AddSegue" its the "+" button
            if  let cell = sender as? UITableViewCell {
                
                // Determine which row the cell is in 
                // * Can add to the "if let" above if you want... (if let cell, let indexPath...) (:
                if  let indexPath = tableView.indexPath(for: cell) {
                    
                    // Use index to get the Player to edit
                    let player = ScoreController.sharedInstance.players[indexPath.row]
                    
                    // Get the next screen using segue.destination
                    // * We can use "!" because we know what type of screen it will be
                    // * We need to make sure it is a ScoreDetailVC so we can edit the "Player"
                    let vc = segue.destination as! ScoreDetailViewController
                    vc.player = player
                }
            }
            
        }
    }
    
}
