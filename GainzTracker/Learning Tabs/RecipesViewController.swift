//
//  RecipesViewController.swift
//  GainzTracker
//
//  Created by Alberto Costa on 11/5/23.
//

import UIKit
import Nuke

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var recipes: [Recipe] = []
    
    
    @IBOutlet weak var recipeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTable.dataSource = self
        recipeTable.delegate = self
        
        // ---- setting URL request ---
        let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=d2d4401c&app_key=43527e7c9fe6345072214d9a750101fb&imageSize=REGULAR&random=true")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)
        
        // error handling
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // do statement
            do {
                
                // Create a JSON Decoder
                let decoder = JSONDecoder()

                print("here")
                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(RecipesResponse.self, from: data)
                print("here x2")

                
                // Access the array of tracks from the `results` property
                let hits = response.hits
                print(hits.first!)
                //let recipes = hits.Recipe as? Recipe
                //print(hits.recipe.label)
                /*
                do {
                    for hit in hits {
                        // Access the 'recipe' object within each hit
                        if let recipes = hits[hit] as? Recipe {
                            // Access the 'calories' value within each recipe
                            if let calories = recipes.recipe["calories"] as? Double {
                                // Print or use the calories value as needed
                                print(calories)
                            }
                        }
                    }
                } catch {
                    print("Error deserializing JSON: \(error)")
                }*/
            
                //var dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]

                print("✅ recipes are here")
                
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    //self?.recipes = recipes

                    // Make the table view reload now that we have new data
                    self?.recipeTable.reloadData()
                }
                
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
            
        }

        // Initiate the network request
        task.resume()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Get the index path for the current selected table view row (if exists)
        if let indexPath = recipeTable.indexPathForSelectedRow {

            // Deslect the row at the corresponding index path
            recipeTable.deselectRow(at: indexPath, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: set look in detail for recipe                        <------ here!!!!
        
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = recipeTable.indexPath(for: cell),
           // Get the detail view controller                          <---- check this out
           
            let detailViewController = segue.destination as? RecipeDetailViewController {
            
            // Use the index path to get the associated track
            let recipe = recipes[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.recipe = recipe
        }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Get a cell with identifier, "TrackCell"
        // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell

        // Get the track that corresponds to the table view row
        let recipe = recipes[indexPath.row]

        // Configure the cell with it's associated track
        cell.configue(with: recipe)

        // return the cell for display in the table view
        return cell
    }
}
