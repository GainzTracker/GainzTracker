//
//  FoodViewController.swift
//  GainzTracker
//
//  Created by Alberto Costa on 11/8/23.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var foods: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMeal))
        addButton.tintColor = UIColor.yellow
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addMeal() {
        let alert = UIAlertController(title: "New Meal", message: "Enter details below", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Meal (String)"
        }
        alert.addTextField { textField in
            textField.placeholder = "Item One (String)"
        }
        alert.addTextField { textField in
            textField.placeholder = "Number of Calories (Int)"
            textField.keyboardType = .numberPad
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Item Two (String)"
            
        }
        alert.addTextField { textField in
            textField.placeholder = "Number of Calories (Int)"
            textField.keyboardType = .numberPad
        }
        /*
        alert.addTextField { textField in
            textField.placeholder = "Total Calories (See Home Tab)"
            textField.keyboardType = .numberPad
        }
        alert.addTextField { textField in
            textField.placeholder = "Calorie Intake Goal (See Home Tab)"
            textField.keyboardType = .numberPad
        }
        */
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let meal = alert.textFields?[0].text,
                  let itemOne = alert.textFields?[1].text,
                  let numCalOne = alert.textFields?[2].text,
                  let itemTwo = alert.textFields?[3].text,
                  let numCalTwo = alert.textFields?[4].text,
                  //let calTotal = alert.textFields?[5].text,
                  //let calGoal = alert.textFields?[6].text,
                  let numCalOneInt = Int(numCalOne),
                  let numCalTwoInt = Int(numCalTwo)
                  //let calTotalInt  = Int(calTotal),
                  //let calGoalInt = Int(calGoal)
            else {
                return
            }
            
            let newFood = Food(meal: meal, itemOne: itemOne, numCalOne: numCalOneInt, itemTwo: itemTwo, numCalTwo: numCalTwoInt 
                               //calTotal: calTotalInt,
                               //calGoal: calGoalInt
            )
            
            self?.foods.append(newFood)
            
            let currentTotalCalories = UserDefaults.standard.double(forKey: "totalCalories")
            //let newTotalCalories = currentTotalCalories + calTotalDouble
            //UserDefaults.standard.set(newTotalCalories, forKey: "totalCalories")

            //UserDefaults.standard.set(calGoalDouble, forKey: "goalCalories")

            
            self?.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateTotalCalories(with calories: Double) {
        let currentTotalCalories = UserDefaults.standard.double(forKey: "totalCalories")
        let newTotalCalories = currentTotalCalories + calories
        UserDefaults.standard.set(newTotalCalories, forKey: "totalCalories")
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as? FoodTableViewCell else {
            fatalError("Cell not found")
        }
        
        let food = foods[indexPath.row]
        cell.food = food
        
        return cell
    }
}
