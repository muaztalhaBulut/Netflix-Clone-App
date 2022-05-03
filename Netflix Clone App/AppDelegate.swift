//
//  AppDelegate.swift
//  Netflix Clone App
//
//  Created by Muaz Talha Bulut on 30.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()
        
        
        return true

    }


}

