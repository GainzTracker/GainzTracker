//
//  Recipe.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 10/26/23.
//

import UIKit

struct Recipe: Codable {
    let label: String
    let image: URL
    let source: String
    let url: URL
    let ingredientLines: [String]

    var briefDescription: String {
        ingredientLines.joined(separator: ", ")
    }
}

struct RecipeSearchResult: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let recipe: Recipe
}
