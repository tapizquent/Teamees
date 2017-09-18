//
//  AppDelegate.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/10/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    public var loggedIn = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        

        window?.rootViewController = UINavigationController(rootViewController: MainVC(collectionViewLayout: layout))
        
        UINavigationBar.appearance().barTintColor = UIColor(red:0.02, green:0.02, blue:0.02, alpha:1.0)
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor(red:0.03, green:0.03, blue:0.03, alpha:1.0)
        window?.addSubview(statusBarBackgroundView)
        window?.addContraintsWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
        window?.addContraintsWithFormat(format: "V:|[v0(20)]", views: statusBarBackgroundView)
        
        FirebaseApp.configure()
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

