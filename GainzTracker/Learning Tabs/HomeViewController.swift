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
    
    var totalWorkoutTime: Double {
        get {
            return UserDefaults.standard.double(forKey: "totalWorkoutTime")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "totalWorkoutTime")
            updateProgressBar()
        }
    }
    
    let arbitraryGoalTime: Double = 120.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressBar()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateProgressBar()
    }

    
    func setupProgressBar() {
        workoutProgressBar.progressTintColor = .orange
        workoutProgressBar.trackTintColor = .lightGray
        updateProgressBar()
    }
    
    func updateProgressBar() {
        let progress = Float(totalWorkoutTime / arbitraryGoalTime)
        workoutProgressBar.setProgress(progress, animated: true)
    }
    
    func addUserWorkoutTime(minutes: Double) {
        // Add the new workout time to the total
        totalWorkoutTime += minutes
    }
}
