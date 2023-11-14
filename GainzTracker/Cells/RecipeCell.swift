//
//  RecipeTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/4/23.
//

import UIKit
import Nuke


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
        print("configure")
        RecipeTitle.text = recipe.label
        RecipeCalories.text = String(recipe.calories)
        
        var meals: String = ""
        for meal in recipe.mealType{
            meals += meal
        }
        RecipeMeal.text = meals
        
        //loading picture
        //NukeUI.loadImage(with: recipe.image, into: RecipePicture)
        //RecipePicture.image = UIImag
        var image: UIImage = UIImage(named: "profile")!
        RecipePicture = UIImageView(image: image)
        
    }
    
    
    
    
}
