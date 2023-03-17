//
//  UserNotifications.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/25/22.
//

import Foundation
import UserNotifications

class HabitNotifications {
    
    static func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notifications Authorized")
            } else {
                print("Notifications Denied")
            }
        }
    }
    
    static func scheduleLocal(habit: Habit) {
        let center = UNUserNotificationCenter.current()
        
        let trackedDaysMirror = Mirror(reflecting: habit.trackedDays)
        var dayInt = 0 //Sunday = 1, Monday = 2,... Saturday = 7
        
        for child in trackedDaysMirror.children {
            var dateComponent = DateComponents()
            dateComponent.calendar = Calendar.current
            dayInt += 1
            if(child.value as! Bool  == true) {
                dateComponent.hour = habit.reminderHour
                dateComponent.minute = habit.reminderMinute
                dateComponent.weekday = dayInt
                
                let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
                let content = UNMutableNotificationContent()
                content.title = "Habit Cracker"
                content.body = "\(habit.habitName) - Another Day, Another Improvement"
                content.sound = UNNotificationSound.default
                
                let idString = habit.notificationIdentifier + String(dayInt)
                
                let request = UNNotificationRequest(identifier: idString, content: content, trigger: calendarTrigger)
                center.add(request)
            }
        }
    }
    
    static func deleteLocal(habit: Habit) {
        let center = UNUserNotificationCenter.current()
        var identifiers = [String]()
        
        let trackedDaysMirror = Mirror(reflecting: habit.trackedDays)
        var dayInt = 0 //Sunday = 1, Monday = 2,... Saturday = 7
        
        for child in trackedDaysMirror.children {
            dayInt += 1
            if(child.value as! Bool == true) {
                let idString = habit.notificationIdentifier + String(dayInt)
                identifiers.append(idString)
            }
        }

        center.removeDeliveredNotifications(withIdentifiers: identifiers)
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}

