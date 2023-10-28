//
//  Recipe.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 10/26/23.
//

import UIKit

enum MealType: String, Decodable {
    case breakfast = "breakfast"
    case brunch = "brunch"
    case lunchDinner = "lunch/dinner"
    case snack = "snack"
    case teatime = "teatime"
}
struct ImageSize {
    static let regular = CGSize(width: 300, height: 300)
}
struct RecipeSearchResponse: Decodable {
    let hits: [RecipeHit]
}

struct RecipeHit: Decodable {
    let recipe: RecipeDetail
}

struct RecipeDetail: Decodable {
    let label: String
    let mealType: MealType
    let image: URL
    let ingredientLines: [String]?
}
class RecipeAPIService {
    
    func fetchRecipes(searchTerm: String? = nil, completion: @escaping ([RecipeDetail]) -> Void) {
        var url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=5278a75c&app_key=9a93e7ba03cf805171ab45844a08eab7")!
        
        if let term = searchTerm {
            let queryItem = URLQueryItem(name: "q", value: term)
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            components.queryItems?.append(queryItem)
            url = components.url!
        }
        
        let request = URLRequest(url: url)
        
    }
}
