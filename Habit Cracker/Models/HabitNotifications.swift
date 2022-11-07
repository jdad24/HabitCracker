//
//  UserNotifications.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/25/22.
//

import Foundation
import UserNotifications

class HabitNotifications {
    let center = UNUserNotificationCenter.current()
    
    func registerLocal() {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notifications Authorized")
            } else {
                print("Notifications Denied")
            }
        }
    }
}

