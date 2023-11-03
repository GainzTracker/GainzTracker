//
//  RecipeViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 10/26/23.

//import UIKit
//
//class RecipeViewController: UIViewController, UITableViewDataSource {
//    var recipes: [RecipeDetail] = []
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.dataSource = self
//
//        let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=5278a75c&app_key=9a93e7ba03cf805171ab45844a08eab7")!
//        let request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            if let error = error {
//                print("❌ Network error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("❌ Data is nil")
//                return
//            }
//
//            let decoder = JSONDecoder()
//
//            do {
//                let response = try decoder.decode(RecipeSearchResponse.self, from: data)
//                self?.recipes = response.hits.map { $0.recipe }
//                
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//                
//                print("✅ Fetched \(response.hits.count) recipes.")
//            } catch let decodeError {
//                print("❌ Decoding error: \(decodeError.localizedDescription)")
//            }
//        }
//        
//        task.resume()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipes.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
//
//        let recipe = recipes[indexPath.row]
//        cell.configure(with: recipe)
//        
//        return cell
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let cell = sender as? UITableViewCell,
//           let indexPath = tableView.indexPath(for: cell),
//           let detailViewController = segue.destination as? DetailViewController {
//            let recipe = recipes[indexPath.row]
//            detailViewController.recipe = recipe
//        }
//    }
//}
