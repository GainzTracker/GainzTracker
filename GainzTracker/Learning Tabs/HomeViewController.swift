//
//  HomeViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    

    @IBOutlet weak var workoutProgressBar: UIProgressView!
    @IBOutlet weak var calorieProgressBar: UIProgressView!
    
    @IBOutlet weak var currentCalLabel: UILabel!
    @IBOutlet weak var goalCalLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var goalTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial setup if needed
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let currentTotalTime = UserDefaults.standard.double(forKey: "totalWorkoutTime")
        let goalTime = UserDefaults.standard.double(forKey: "goalWorkoutTime")
        let currentTotalCalories = UserDefaults.standard.double(forKey: "totalCalories")
        let goalCalories = UserDefaults.standard.double(forKey: "goalCalories")

        updateWorkoutProgressBar(with: currentTotalTime, goal: goalTime)
        updateCalorieProgressBar(with: currentTotalCalories, goal: goalCalories)

        currentTimeLabel.text = "\(Int(currentTotalTime)) mins"
        goalTimeLabel.text = "\(Int(goalTime)) mins"

        currentCalLabel.text = "\(Int(currentTotalCalories)) Cal"
        goalCalLabel.text = "\(Int(goalCalories)) Cal"
    }

    func updateWorkoutProgressBar(with currentTime: Double, goal: Double) {
        let progress = Float(currentTime / goal)
        workoutProgressBar.setProgress(progress, animated: true)
    }
    
    func updateCalorieProgressBar(with currentCalories: Double, goal: Double) {
        let progress = Float(currentCalories / goal)
        calorieProgressBar.setProgress(progress, animated: true)
    }
}
