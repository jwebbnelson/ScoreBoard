//
//  ScoreDetailViewController.swift
//  Scoreboard
//
//  Created by Jordan Nelson on 7/13/17.
//  Copyright © 2017 VisionTech. All rights reserved.
//

import UIKit

class ScoreDetailViewController: UIViewController {

    var player: Player?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check to see if we are editing an existing player
        if let player = player {
            updateDetails(player: player)
        } else {
            self.title = "New Player"
            // Hide Score Input and label
            self.scoreLabel.alpha = 0
            self.scoreStepper.alpha = 0
        }
    }

    // Set up screen according to player details
    func updateDetails(player:Player) {
        
        // * Stepper uses double, so the score must be converted
        scoreStepper.value = Double(player.score)
        // * Convert back to Int (just rounds to a nice whole number)
        scoreLabel.text = "\(Int(scoreStepper.value))"
        nameTextField.text = player.name
        self.title = "Update Player"
    }
    
    // Called when the stepped is tapped
    @IBAction func scoreValueChanged(_ sender: Any) {
        scoreLabel.text = "\(Int(scoreStepper.value))"
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
      
        // Check to make sure the name is not empty
        // Works similar to an "if let"
        guard let name = nameTextField.text else { return }

        // Check to see if we are updating a player or creating a new one
        if let player = player {
 
            ScoreController.sharedInstance.updatePlayerScore(player: player, name: name, score: Int(scoreStepper.value))
        } else {
            // Create new Player
            ScoreController.sharedInstance.createNewPlayer(name: name)
            
        }
        
        // Return to the Home screen
        navigationController?.popViewController(animated: true)
    }
}
