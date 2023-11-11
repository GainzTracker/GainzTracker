//
//  HomeViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var calorieProgressBar: UIStackView!
    @IBOutlet weak var workoutProgressBar: UIProgressView!
    
    @IBOutlet weak var currentCalLabel: UILabel!
    @IBOutlet weak var goalCalLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var goalTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let currentTotalTime = UserDefaults.standard.double(forKey: "totalWorkoutTime")
        let goalTime = UserDefaults.standard.double(forKey: "goalWorkoutTime")

        updateProgressBar(with: currentTotalTime, goal: goalTime)
        
        currentTimeLabel.text = "\(Int(currentTotalTime)) mins"
        goalTimeLabel.text = "\(Int(goalTime)) mins"
    }

    func updateProgressBar(with currentTime: Double, goal: Double) {
        let progress = Float(currentTime / goal)
        workoutProgressBar.setProgress(progress, animated: true)
    }
    
}
