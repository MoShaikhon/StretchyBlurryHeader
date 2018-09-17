//
//  AppDelegate.swift
//  StretchyCollection
//
//  Created by Ryan Poolos on 1/19/16.
//  Copyright © 2016 Frozen Fire Studios, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let initialViewController = ViewController()
//        let navController = UINavigationController(rootViewController: initialViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialViewController
        window?.backgroundColor = UIColor.black
        window?.makeKeyAndVisible()
        
        return true
    }
    

}

