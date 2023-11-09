//
//  WorkoutDiaryViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

class WorkoutDiaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView! 

    var exercises: [Exercise] = [Exercise(name: "Push Up", sets: 3, reps: 12, weight: 0.0)]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addExercise() {
        let alert = UIAlertController(title: "New Exercise/Workout", message: "Enter details below", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        alert.addTextField { textField in
            textField.placeholder = "Sets"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { textField in
            textField.placeholder = "Reps"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { textField in
            textField.placeholder = "Weight"
            textField.keyboardType = .decimalPad
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let strongSelf = self,
                  let name = alert.textFields?[0].text,
                  let sets = alert.textFields?[1].text,
                  let reps = alert.textFields?[2].text,
                  let weight = alert.textFields?[3].text,
                  let setsInt = Int(sets),
                  let repsInt = Int(reps),
                  let weightDouble = Double(weight) else { return }

            let newExercise = Exercise(name: name, sets: setsInt, reps: repsInt, weight: weightDouble)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as? ExerciseTableViewCell else {
            fatalError("Cell not found")
        }

        let exercise = exercises[indexPath.row]
        cell.nameTextField.text = exercise.name
        cell.setsTextField.text = "\(exercise.sets)"
        cell.repsTextField.text = "\(exercise.reps)"
        cell.weightTextField.text = "\(exercise.weight)"
        cell.exercise = exercise

        // Set the closure to handle updates from the cell
        cell.onExerciseUpdated = { [weak self] updatedExercise in
            guard let strongSelf = self else { return }
            strongSelf.exercises[indexPath.row] = updatedExercise
            strongSelf.tableView.reloadRows(at: [indexPath], with: .none)
        }

        return cell
    }

}
