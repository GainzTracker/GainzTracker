//
//  RecipeViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 10/26/23.

import UIKit

class RecipesViewController: UIViewController {
    var recipes = [Recipe]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.title = "Recipes"
        self.tabBarItem.image = UIImage(named: "fork.knife")
        
        fetchRecipes()
    }

    func fetchRecipes() {
        EdamamService().fetchRecipes(query: "chicken") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipes):
                    self?.recipes = recipes
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                    // Show user an error state
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe = recipes[indexPath.row]
        cell.titleLabel?.text = recipe.label
        cell.descriptionLabel?.text = recipe.briefDescription
        return cell
    }
}

// MARK: - UITableViewDelegate
extension RecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = recipes[indexPath.row]
    }
}
