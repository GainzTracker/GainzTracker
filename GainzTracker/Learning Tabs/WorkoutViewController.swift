//
//  WorkoutViewController.swift
//  GainzTracker
//
//  Created by Karolyn Carcache on 11/13/23.
//

import UIKit

class WorkoutViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell with identifier, "TrackCell"
        // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutCell

        // Get the track that corresponds to the table view row
        let workout = workouts[indexPath.row]

        // Configure the cell with it's associated track
        cell.configure(with: workout)

        // return the cell for display in the table view
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    var workouts: [Workout] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        workouts = Workout.mockWorkouts
        //print(workouts)
        
        tableView.dataSource = self


        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? WorkoutDetailViewController {

            // Use the index path to get the associated track
            let workout = workouts[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.workout = workout
        }
    }
    

}
