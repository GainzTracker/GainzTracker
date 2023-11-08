//
//  RecipeTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/4/23.
//

import UIKit
import Nuke


class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RecipeTitle: UILabel!
    @IBOutlet weak var RecipeCalories: UILabel!
    @IBOutlet weak var RecipeMeal: UILabel!
    @IBOutlet weak var RecipePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configue(with recipe: Recipe) {
        RecipeTitle.text = recipe.label
        RecipeCalories.text = String( recipe.calories)
        RecipeMeal.text = recipe.mealType
        
        //loading picture
        //NukeUI.loadImage(with: recipe.image, into: RecipePicture)
        
    }
    
    
    
    
}
