//
//  ProfileViewController.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 11/13/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserProfile()
    }
    
    func loadUserProfile() {
        if let currentUser = User.current {
            usernameLabel.text = currentUser.username
            emailLabel.text = currentUser.email
        } else {
            print("No user is currently logged in.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userDidSignUp(notification:)),
            name: Notification.Name("userDidSignUp"),
            object: nil
        )
    }
    
    @objc func userDidSignUp(notification: Notification) {
        if let user = notification.userInfo?["user"] as? User {
            usernameLabel.text = user.username
            emailLabel.text = user.email
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
