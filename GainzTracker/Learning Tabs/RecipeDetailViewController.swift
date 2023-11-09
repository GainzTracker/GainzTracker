//
//  RecipeDetailViewController.swift
//  GainzTracker
//
//  Created by Alberto Costa on 11/8/23.
//

import UIKit
import Nuke

class RecipeDetailViewController: UIViewController {
    
    
    @IBOutlet weak var RecipeLabel: UILabel!
    
    var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Nuke.loadImage(with: track.artworkUrl100, into: backdrop)
        
        RecipeLabel.text = recipe.label
        //escText.text = track.primaryGenreName
    }

}

