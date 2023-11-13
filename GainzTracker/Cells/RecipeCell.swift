//
//  RecipeTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/4/23.
//

import UIKit
import Nuke
import NukeUI


class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var RecipeTitle: UILabel!
    @IBOutlet weak var RecipeCalories: UILabel!
    @IBOutlet weak var RecipeMeal: UILabel!
    @IBOutlet weak var RecipePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configue(with recipe: Recipe) {
        RecipeTitle.text = recipe.label
        RecipeCalories.text = String(recipe.calories)
        var types:String = ""
        for type in recipe.mealType{
            types += type
        }
        RecipeMeal.text = types
        
        //loading picture
        let url:URL = URL(string: recipe.image)!
        //Nuke.loadImage(with: url, into: RecipePicture.image)
        //Nuke.
    }
    
}
