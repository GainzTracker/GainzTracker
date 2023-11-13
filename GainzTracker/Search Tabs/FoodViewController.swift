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
        alert.addTextField { $0.placeholder = "Meal" }
        alert.addTextField { $0.placeholder = "Item One"; $0.keyboardType = .default }
        alert.addTextField { $0.placeholder = "Calories for Item One"; $0.keyboardType = .numberPad }
        alert.addTextField { $0.placeholder = "Item Two"; $0.keyboardType = .default }
        alert.addTextField { $0.placeholder = "Calories for Item Two"; $0.keyboardType = .numberPad }

        let addAction = UIAlertAction(title: "Add", style: .default) { [unowned self] _ in
            let mealName = alert.textFields?[0].text ?? "Default Meal"
            let itemOneName = alert.textFields?[1].text ?? "Item One"
            let itemOneCalories = Int(alert.textFields?[2].text ?? "0") ?? 0
            let itemTwoName = alert.textFields?[3].text ?? "Item Two"
            let itemTwoCalories = Int(alert.textFields?[4].text ?? "0") ?? 0

            let newFood = Food(
                meal: mealName,
                itemOne: itemOneName,
                numCalOne: itemOneCalories,
                itemTwo: itemTwoName,
                numCalTwo: itemTwoCalories
            )

            self.foods.append(newFood)
            self.tableView.reloadData()
        }
        
        alert.addAction(addAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
//    func updateTotalCalories(with calories: Double) {
//        let currentTotalCalories = UserDefaults.standard.double(forKey: "totalCalories")
//        let newTotalCalories = currentTotalCalories + calories
//        UserDefaults.standard.set(newTotalCalories, forKey: "totalCalories")
//        
//    }
    
    
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
