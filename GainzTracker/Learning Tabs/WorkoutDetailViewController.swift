//
//  WorkoutDetailViewController.swift
//  GainzTracker
//
//  Created by Karolyn Carcache on 11/13/23.
//

import UIKit

class WorkoutDetailViewController: UIViewController {

    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    var workout: Workout!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipmentLabel.text = workout.equipment
        instructionsLabel.text = workout.instructions
        typeLabel.text = workout.type
        muscleLabel.text = workout.muscle
        workoutNameLabel.text = workout.name
        difficultyLabel.text = workout.difficulty
        
        

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
