//
//  AppDelegate.swift
//  hw_FaceCount
//
//  Created by Mavlon on 29/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MainTabBar()
        window?.makeKeyAndVisible()
        
        return true
    }


}

