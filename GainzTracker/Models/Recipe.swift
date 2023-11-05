//
//  Recipe.swift
//  GainzTracker
//
//  Created by Alberto Costa on 11/5/23.
//

import Foundation

struct Recipe: Decodable {
    let recipeTitle: String
    let recipeOverview: String
    let recipePic: URL
    
    let source: URL
    let calories: Double
    let cuisineType: String
    let mealType: String
}

struct RecipesResponse: Decodable {
    var callResults: [Recipe] = []
}

