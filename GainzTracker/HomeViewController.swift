//
//  HomeViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/2/23.
//

import UIKit
import ParseSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
    }
    
    func loadUserData() {
        if let currentUser = User.current {
            usernameLabel.text = currentUser.username
            emailLabel.text = currentUser.email
            
        }
    }
}
