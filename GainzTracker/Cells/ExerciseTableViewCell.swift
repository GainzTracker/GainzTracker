//
//  ExerciseTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!


    @IBAction func nameLabelTapped(_ sender: Any) {
        nameLabel.text = "Enter Workout"
    }

    
    @IBAction func SetsNumberTapped(_ sender: Any) {
        setsLabel.text = "Enter Sets"
    }
    
    
    @IBAction func RepsNumberTapped(_ sender: Any) {
        repsLabel.text = "Enter Reps"
    }
    
    @IBAction func WeightNumberTapped(_ sender: Any) {
        weightLabel.text = "Enter Weight"
    }
    
    
}
