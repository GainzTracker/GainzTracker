//
//  WorkoutDiaryViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

class WorkoutDiaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var exercises: [Exercise] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
        addButton.tintColor = UIColor.yellow
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addExercise() {
        let alert = UIAlertController(title: "New Exercise/Workout", message: "Enter details below", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        alert.addTextField { textField in
            textField.placeholder = "Sets (Int)"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { textField in
            textField.placeholder = "Reps (Int)"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { textField in
            textField.placeholder = "Weight (Double)"
            textField.keyboardType = .decimalPad
        }
        /*
        alert.addTextField { textField in
            textField.placeholder = "Workout Time (See Home Tab)"
            textField.keyboardType = .decimalPad
        }
        alert.addTextField { textField in
            textField.placeholder = "Goal Time (See Home Tab)"
            textField.keyboardType = .decimalPad
        }
        */
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let name = alert.textFields?[0].text,
                  let sets = alert.textFields?[1].text,
                  let reps = alert.textFields?[2].text,
                  let weight = alert.textFields?[3].text,
                  //let time = alert.textFields?[4].text,
                  //let goal = alert.textFields?[5].text,
                  let setsInt = Int(sets),
                  let repsInt = Int(reps),
                  let weightDouble = Double(weight)
                  //let workoutTimeDouble = Double(time),
                  //let goalTimeDouble = Double(goal)
            else { return }

            let newExercise = Exercise(name: name, sets: setsInt, reps: repsInt, weight: weightDouble
                                       //time: workoutTimeDouble,
                                       //goal: goalTimeDouble
            )

            self?.exercises.append(newExercise)

            let currentTotalTime = UserDefaults.standard.double(forKey: "totalWorkoutTime")
            //let newTotalTime = currentTotalTime + workoutTimeDouble
            //UserDefaults.standard.set(newTotalTime, forKey: "totalWorkoutTime")

            //UserDefaults.standard.set(goalTimeDouble, forKey: "goalWorkoutTime")

            self?.tableView.reloadData()
        }

        alert.addAction(addAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateTotalWorkoutTime(with minutes: Double) {
        let currentTotalTime = UserDefaults.standard.double(forKey: "totalWorkoutTime")
        let newTotalTime = currentTotalTime + minutes
        UserDefaults.standard.set(newTotalTime, forKey: "totalWorkoutTime")
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCell", for: indexPath) as? ExerciseTableViewCell else {
            fatalError("Cell not found")
        }
        
        let exercise = exercises[indexPath.row]
        cell.exercise = exercise
        
        return cell
    }
    
}
