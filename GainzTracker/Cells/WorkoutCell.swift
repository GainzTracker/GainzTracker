//
//  WorkoutCell.swift
//  GainzTracker
//
//  Created by Karolyn Carcache on 11/13/23.
//

import UIKit

class WorkoutCell: UITableViewCell {

    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var workoutNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Configures the cell's UI for the given track.
    func configure(with workout: Workout) {
        difficultyLabel.text = workout.difficulty
        typeLabel.text = workout.type
        workoutNameLabel.text = workout.name
    }

}
