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
    
    func scheduleLocal(habit: Habit) {
        let trackedDaysMirror = Mirror(reflecting: habit.trackedDays)
        
        var dayCount = 0 //Sunday = 1, Monday = 2,... Saturday = 7
        for child in trackedDaysMirror.children {
            dayCount += 1
            if(child.value as! Bool  == true) {
                let day = child.label!.substring(from: 2, to: child.label!.count)
                
                var dateComponent = DateComponents()
                dateComponent.hour = 6
                dateComponent.weekday = dayCount
                
                let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
                let content = UNMutableNotificationContent()
                content.title = "Habit Cracker"
                content.body = "\(habit.habitName) - Another Day, Another Crack"
                content.sound = UNNotificationSound.default
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: calendarTrigger)
                
                center.add(request)
                
            }
        }
    }
}

