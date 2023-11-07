//
//  WorkoutDiaryViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/7/23.
//

import UIKit

struct Exercise {
    let name: String
    var sets: Int
    var reps: Int
    var weight: Double
}

class WorkoutDiaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var exercises: [Exercise] = [Exercise(name: "Push Up", sets: 3, reps: 12, weight: 0.0)]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ExerciseTableViewCell", bundle: nil), forCellReuseIdentifier: "ExerciseCell")
        view.addSubview(tableView)

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
        navigationItem.rightBarButtonItem = addButton
    }

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
        cell.nameLabel.text = exercise.name
        cell.setsLabel.text = "Sets: \(exercise.sets)"
        cell.repsLabel.text = "Reps: \(exercise.reps)"
        cell.weightLabel.text = "Weight: \(exercise.weight)"

        return cell
    }

    @objc func addExercise() {
        let newExercise = Exercise(name: "New Exercise", sets: 3, reps: 10, weight: 50.0)
        exercises.append(newExercise)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedExercise = exercises[indexPath.row]
        print("Selected exercise: \(selectedExercise.name)")
    }
}

