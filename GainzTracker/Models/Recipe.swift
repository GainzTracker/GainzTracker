//
//  Recipe.swift
//  GainzTracker
//
//  Created by Alberto Costa on 11/5/23.
//

import Foundation

struct Recipe: Decodable {
    let label: String
    let image: URL
    let url: URL
    let calories: Double
    let cuisineType: String
    let mealType: String
    let ingredientLines: [String]
}

struct RecipesResponse: Decodable {
    var callResults: [Recipe] = []
}

