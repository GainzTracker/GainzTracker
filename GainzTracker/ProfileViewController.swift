//
//  HomeViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/2/23.
//

import UIKit
import ParseSwift

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightGoalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage(named: "house.fill_icon")
    }
    
    func loadUserData() {
        if let currentUser = User.current {
            usernameLabel.text = currentUser.username
            emailLabel.text = currentUser.email
            
        }
    }

}
