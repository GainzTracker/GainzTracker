//
//  ExerciseTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

struct Exercise {
    var name: String
    var sets: Int
    var reps: Int
    var weight: Double
}

class ExerciseTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    // MARK: - Properties
    var exercise: Exercise? {
        didSet {
            // Update the text fields when the exercise is set
            nameTextField.text = exercise?.name
            setsTextField.text = "\(exercise?.sets ?? 0)"
            repsTextField.text = "\(exercise?.reps ?? 0)"
            weightTextField.text = "\(exercise?.weight ?? 0.0)"
        }
    }
    
    var onExerciseUpdated: ((Exercise) -> Void)?
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set the delegate for text fields
        nameTextField.delegate = self
        setsTextField.delegate = self
        repsTextField.delegate = self
        weightTextField.delegate = self
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let exercise = exercise else { return }
        
        if textField == nameTextField {
            self.exercise?.name = textField.text ?? ""
        } else if textField == setsTextField {
            self.exercise?.sets = Int(textField.text ?? "") ?? 0
        } else if textField == repsTextField {
            self.exercise?.reps = Int(textField.text ?? "") ?? 0
        } else if textField == weightTextField {
            self.exercise?.weight = Double(textField.text ?? "") ?? 0.0
        }
        
        // If there's an update closure set, call it
        onExerciseUpdated?(exercise)
    }
    
    // Add other necessary methods and logic as needed
}
