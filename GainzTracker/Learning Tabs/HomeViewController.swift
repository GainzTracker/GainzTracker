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
    
    static let averageDailyCalories: Double = 2000
    static let averageWorkoutTime: Double = 45
    static let goalWorkoutTime: Double = 60
    static let goalCalorieIntake: Double = 2500
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateCalorieProgressBar(with: HomeViewController.averageDailyCalories, goal: HomeViewController.goalCalorieIntake)
        updateWorkoutProgressBar(with: HomeViewController.averageWorkoutTime, goal: HomeViewController.goalWorkoutTime)
        
        currentCalLabel.text = "\(Int(HomeViewController.averageDailyCalories)) cal"
        goalCalLabel.text = "\(Int(HomeViewController.goalCalorieIntake)) cal"
        currentTimeLabel.text = "\(Int(HomeViewController.averageWorkoutTime)) mins"
        goalTimeLabel.text = "\(Int(HomeViewController.goalWorkoutTime)) mins"
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
