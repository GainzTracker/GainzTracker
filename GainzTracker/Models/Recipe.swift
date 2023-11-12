//
//  Recipe.swift
//  GainzTracker
//
//  Created by Alberto Costa on 11/5/23.
//

import Foundation

struct Recipe: Decodable {
    let label: String
    let image: String
    let url: String
    let ingredientLines: [String]
    let calories: Double
    let cuisineType: [String]
    let mealType: [String]
    
}

struct RecipesResponse: Decodable {
    var hits: [Hit] = []
}

struct Hit: Decodable {
    var recipe: Recipe
    //var _links: Links
}

