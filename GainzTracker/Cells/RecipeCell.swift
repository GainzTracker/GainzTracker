//
//  RecipeCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 10/27/23.
//


import UIKit
import Nuke

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeOverviewLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with recipe: RecipeDetail) {
        recipeTitleLabel.text = recipe.label
        recipeOverviewLabel.text = recipe.ingredientLines?.first
        
        if let imageURL = URL(string: recipe.image.absoluteString) {
            Nuke.loadImage(with: imageURL, into: recipeImageView)
        }
    }
}
