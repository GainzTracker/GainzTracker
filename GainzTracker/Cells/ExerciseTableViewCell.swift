//
//  ExerciseTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    // MARK: - Properties
    var exercise: Exercise?
    
    func didSet() {
        // Update the text fields when the exercise is set
        nameTextField.text = exercise!.name
        setsTextField.text = String(exercise!.sets)
        repsTextField.text = String(exercise!.reps)
        weightTextField.text = String(exercise!.weight)
    }

    
    var onExerciseUpdated: ((Exercise) -> Void)?
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        //guard let exercise = exercise else { return }
        /*
        if textField == nameTextField {
            self.exercise?.name = textField.text ?? ""
        } else if textField == setsTextField {
            self.exercise?.sets = Int(textField.text ?? "") ?? 0
        } else if textField == repsTextField {
            self.exercise?.reps = Int(textField.text ?? "") ?? 0
        } else if textField == weightTextField {
            self.exercise?.weight = Double(textField.text ?? "") ?? 0.0
        }*/
        print("hey")
        /*if textField == nameTextField {
            self.exercise?.name = textField.text ?? ""
        } else if textField == setsTextField {
            self.exercise?.sets = Int(textField.text ?? "") ?? 0
        } else if textField == repsTextField {
            self.exercise?.reps = Int(textField.text ?? "") ?? 0
        } else if textField == weightTextField {
            self.exercise?.weight = Double(textField.text ?? "") ?? 0.0
        }*/

        onExerciseUpdated?(exercise!)
    }
    
    func configue(with exercise: Exercise) {
        nameTextField.text = exercise.name
        setsTextField.text = String(exercise.sets)
        repsTextField.text = String(exercise.reps)
        weightTextField.text = String(exercise.weight)
        
        //loading picture
        //NukeUI.loadImage(with: recipe.image, into: RecipePicture)
        
    }
}
