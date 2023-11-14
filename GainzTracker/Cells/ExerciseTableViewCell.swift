//
//  ExerciseTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // MARK: - Properties
    var exercise: Exercise? {
        didSet {
            nameLabel.text = exercise?.name ?? "Workout"
            setsLabel.text = exercise?.sets.description ?? "NumberSets"
            repsLabel.text = exercise?.reps.description ?? "NumberReps"
            weightLabel.text = exercise?.weight.description ?? "NumberWeight"
        }
    }

    
    var onExerciseUpdated: ((Exercise) -> Void)?
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
