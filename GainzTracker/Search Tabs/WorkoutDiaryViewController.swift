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
        alert.addTextField { textField in
            textField.placeholder = "Workout Time (Double)"
            textField.keyboardType = .decimalPad
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let strongSelf = self,
                  let name = alert.textFields?[0].text,
                  let sets = alert.textFields?[1].text,
                  let reps = alert.textFields?[2].text,
                  let weight = alert.textFields?[3].text,
                  let time = alert.textFields?[4].text,
                  let setsInt = Int(sets),
                  let repsInt = Int(reps),
                  let weightDouble = Double(weight),
                  let workoutTimeDouble = Double(time) else { return }
            
            print("Name: \(name)")
            print("Sets: \(setsInt)")
            print("Reps: \(repsInt)")
            print("Weight: \(weightDouble)")
            print("Workout Time: \(workoutTimeDouble)")
            
            let newExercise = Exercise(name: name, sets: setsInt, reps: repsInt, weight: weightDouble, time: workoutTimeDouble)
            strongSelf.exercises.append(newExercise)
            strongSelf.tableView.reloadData()
            
        }
        alert.addAction(addAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    // UITableViewDataSource Methods
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
