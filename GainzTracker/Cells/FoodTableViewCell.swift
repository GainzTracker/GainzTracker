//
//  FoodTableViewCell.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/12/23.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var itemOneLabel: UILabel!
    @IBOutlet weak var itemTwoLabel: UILabel!
    @IBOutlet weak var numCalOneLabel: UILabel!
    @IBOutlet weak var numCalTwoLabel: UILabel!
    @IBOutlet weak var totalCalLabel: UILabel!
    
    // MARK: - Properties
    var food: Food? {
        didSet {
          
            mealLabel.text = food?.meal ?? "Meal"
            itemOneLabel.text = food?.itemOne.description ?? "ItemOne"
            itemTwoLabel.text = food?.itemTwo.description ?? "ItemTwo"
            numCalOneLabel.text = food?.numCalOne.description ?? "NumberCaloriesOne"
            numCalTwoLabel.text = food?.numCalTwo.description ?? "NumberCaloriesTwo"
            //totalCalLabel.text = food?.calTotal.description ?? "CalorieTotal"
        }
    }
    
    
    var onFoodUpdated: ((Food) -> Void)?
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
