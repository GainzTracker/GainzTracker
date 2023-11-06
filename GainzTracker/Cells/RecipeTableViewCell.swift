//
//  RecipeTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/4/23.
//

import UIKit
import NukeUI

class RecipeTableViewCell: UITableViewCell {
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configue(with recipe: Recipe) {
        RecipeTitle.text = recipe.label
        RecipeCalories.text = recipe.calories
        RecipeMeal.text = recipe.mealType
        
        //loading picture
        //Nuke.loadImage(with: recipe.recipePic, into: RecipePicture)
        RecipePicture.image = NukeUI.ImageRequest(recipe.recipePic)

    }
    
    
    
    
}
