//
//  RecipeTableViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/5/23.
//

import UIKit
import Nuke

class RecipeTableViewController: UITableViewController {
    var recipes = [Recipe]()
    

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
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe = recipes[indexPath.row]
        cell.RecipeTitle?.text = recipe.label
        cell.RecipeOverview?.text = recipe.briefDescription
        return cell
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipe = recipes[indexPath.row]
    }
    
}
