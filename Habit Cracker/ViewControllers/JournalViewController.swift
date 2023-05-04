//
//  JournalViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 3/14/23.
//

import UIKit
import CalendarKit

class JournalViewController: DayViewController {
    var habitList: [Habit]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Journal"
        
        dayView.timelinePagerView.autoScrollToFirstEvent = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        habitList = Habit.readHabitFile() // Get events (models) from the storage 
        dayView.reloadData()
        
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        
        var style = CalendarStyle()
        
        if(UITraitCollection.current.userInterfaceStyle == .dark) {
            style.header.backgroundColor = ThemeProperties.journal.darkModeBackgroundColor
            style.header.daySelector.inactiveTextColor = ThemeProperties.journal.darkModePrimaryTextColor
            style.header.daySelector.weekendTextColor = ThemeProperties.journal.darkModePrimaryTextColor
            style.header.daySelector.todayActiveTextColor = ThemeProperties.journal.darkModeTodayActiveTextColor
            style.header.daySelector.todayInactiveTextColor = ThemeProperties.journal.activeBackgroundColor
            style.header.daySelector.todayActiveBackgroundColor = ThemeProperties.journal.activeBackgroundColor
            style.header.daySymbols.weekendColor = ThemeProperties.journal.darkModePrimaryTextColor
            style.header.daySymbols.weekDayColor = ThemeProperties.journal.darkModePrimaryTextColor
            style.header.swipeLabel.textColor = ThemeProperties.journal.darkModePrimaryTextColor
            style.timeline.backgroundColor = ThemeProperties.journal.darkModeBackgroundColor
            style.timeline.timeColor = ThemeProperties.journal.darkModePrimaryTextColor
        } else {
            style.header.backgroundColor = ThemeProperties.journal.lightModeBackgroundColor
            style.header.daySelector.inactiveTextColor = ThemeProperties.journal.lightModePrimaryTextColor
            style.header.daySelector.weekendTextColor = ThemeProperties.journal.lightModePrimaryTextColor
            style.header.daySelector.todayActiveTextColor = ThemeProperties.journal.lightModeTodayActiveTextColor
            style.header.daySelector.todayInactiveTextColor = ThemeProperties.journal.activeBackgroundColor
            style.header.daySelector.todayActiveBackgroundColor = ThemeProperties.journal.activeBackgroundColor
            style.header.daySymbols.weekendColor = ThemeProperties.journal.lightModePrimaryTextColor
            style.header.daySymbols.weekDayColor = ThemeProperties.journal.lightModePrimaryTextColor
            style.header.swipeLabel.textColor = ThemeProperties.journal.lightModePrimaryTextColor
            style.timeline.backgroundColor = ThemeProperties.journal.lightModeBackgroundColor
            style.timeline.timeColor = ThemeProperties.journal.lightModePrimaryTextColor
        }
        
        style.timeline.separatorColor = .clear
        style.timeline.timeIndicator.color = ThemeProperties.journal.activeBackgroundColor
        dayView.updateStyle(style)
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let habitList = Habit.readHabitFile() // Get events (models) from the storage
        var events = [Event]()
        
        for habit in habitList {
            // Create new EventView
            let trackedDayMirror = Mirror(reflecting: habit.trackedDays)
            var dayInt = 0
            
            for day in trackedDayMirror.children {
                dayInt += 1
                if(dayInt == Calendar.current.component(.weekday, from: date) && day.value as! Bool == true) {
                    let event = Event()
                    event.textColor = .white
                    
                    var startDate = date
                    startDate = Calendar.current.date(bySetting: .hour, value: Calendar.current.component(.hour, from: habit.reminderTime), of: startDate)!
                    startDate = Calendar.current.date(bySetting: .minute, value: Calendar.current.component(.minute, from: habit.reminderTime), of: startDate)!
                    
                    var endDate = date
                    endDate = Calendar.current.date(byAdding: .minute, value: 30, to: startDate)!
                    event.dateInterval = DateInterval(start: startDate, end: endDate)
                    
                    let info = [habit.habitName, String(habit.daysElapsed)]
                    event.text = info.reduce("", {$0 + $1 + "\n"})
                    events.append(event)
                }
            }
        }
        events.forEach({
            print($0.dateInterval)
        })
        return events
    }
    
    override func dayViewDidSelectEventView(_ eventView: EventView) {
        print("Event has been selected: \(eventView)")
    }
    
    override func dayViewDidLongPressEventView(_ eventView: EventView) {
        print("Event has been longPressed: \(eventView)")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
