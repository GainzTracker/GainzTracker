//
//  AppDelegate.swift
//  GainzTracker
//
//  Created by Alberto Costa on 10/20/23.
//

import UIKit
import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Initialize Parse SDK
        initializeParse()

        return true
    }

    public func initializeParse(customObjectId: Bool = false) {
        let applicationId = "hHekp8bi1Chh1zQ7aD4khsUWin41oTbD0jROQ5AT"
        let clientKey = "7vKPrZ4GVJ87oJq0E9UnyCYMvg0K0hzI2cJctpOG"
        let serverURL = URL(string: "https://parseapi.back4app.com/")!

        ParseSwift.initialize(applicationId: applicationId,
                              clientKey: clientKey,
                              serverURL: serverURL,
                              allowingCustomObjectIds: customObjectId,
                              usingEqualQueryConstraint: false,
                              usingDataProtectionKeychain: false)
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

