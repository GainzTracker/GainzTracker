//
//  RecipeTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/4/23.
//

import UIKit
import NukeUI

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RecipePicture: UIImageView!
    @IBOutlet weak var RecipeTitle: UILabel!
    @IBOutlet weak var RecipeOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configue(with recipe: Recipe) {
        RecipeTitle.text = recipe.recipeTitle
        RecipeOverview.text = recipe.recipeOverview
        
        //loading picture
        //Nuke.loadImage(with: recipe.recipePic, into: RecipePicture)
        RecipePicture.image = NukeUI.ImageRequest(recipe.recipePic)

    }
    
    
    
    
}
