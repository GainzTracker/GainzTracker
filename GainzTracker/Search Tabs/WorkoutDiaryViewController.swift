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
        alert.addTextField { $0.placeholder = "Name" }
        alert.addTextField { $0.placeholder = "Sets (Int)"; $0.keyboardType = .numberPad }
        alert.addTextField { $0.placeholder = "Reps (Int)"; $0.keyboardType = .numberPad }
        alert.addTextField { $0.placeholder = "Weight (Double)"; $0.keyboardType = .decimalPad }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            let name = alert.textFields?[0].text ?? "Default Exercise"
            let sets = Int(alert.textFields?[1].text ?? "0") ?? 0
            let reps = Int(alert.textFields?[2].text ?? "0") ?? 0
            let weight = Double(alert.textFields?[3].text ?? "0.0") ?? 0.0
            
            let newExercise = Exercise(name: name, sets: sets, reps: reps, weight: weight)
            self?.exercises.append(newExercise)
            self?.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
//    func updateTotalWorkoutTime(with minutes: Double) {
//        let currentTotalTime = UserDefaults.standard.double(forKey: "totalWorkoutTime")
//        let newTotalTime = currentTotalTime + minutes
//        UserDefaults.standard.set(newTotalTime, forKey: "totalWorkoutTime")
//    }
    

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
    
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     // Get a cell with identifier, "TrackCell"
     // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
     let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
     
     // Get the track that corresponds to the table view row
     let recipe = recipes[indexPath.row]
     
     // Configure the cell with it's associated track
     cell.configue(with: recipe)
     
     // return the cell for display in the table view
     return cell
     }*/
    
    
}
