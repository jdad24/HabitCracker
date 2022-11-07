//
//  AppDelegate.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        HabitNotifications().registerLocal()
        
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = UIColor(displayP3Red: 100/255, green: 45/255, blue: 175/255, alpha: 1.0)
//        navbarAppearance.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        UINavigationBar.appearance().standardAppearance = navbarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()
            
            tabBarAppearance.backgroundColor = UIColor(displayP3Red: 100/255, green: 45/255, blue: 175/255, alpha: 1.0)
//            tabBarAppearance.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8)
            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 0/255, green: 100/255, blue: 200/255, alpha: 1.0)]
            tabBarItemAppearance.selected.iconColor = UIColor(displayP3Red: 0/255, green: 100/255, blue: 200/255, alpha: 1.0)
            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        } else {
            UITabBar.appearance().barTintColor = UIColor(displayP3Red: 0/255, green: 45/255, blue: 156/255, alpha: 1.0)
            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().tintColor = .white
            UITabBar.appearance().unselectedItemTintColor = .black
        }
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        .portrait
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



