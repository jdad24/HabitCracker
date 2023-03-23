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
//        habitList = Habit.readHabitFile() // Get events (models) from the storage / API
        
        navigationItem.title = "Journal"
        dayView.timelinePagerView.autoScrollToFirstEvent = true
        
        var style = CalendarStyle()
        style.timeline.separatorColor = .clear
        dayView.updateStyle(style)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        habitList = Habit.readHabitFile() // Get events (models) from the storage / API
        dayView.reloadData()
    }
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let habitList = Habit.readHabitFile() // Get events (models) from the storage / API
        print(date, Calendar.current.component(.weekday, from: date))
        
        var events = [Event]()
        
        for habit in habitList {
            // Create new EventView
            let trackedDayMirror = Mirror(reflecting: habit.trackedDays)
            var dayInt = 0
            
            for day in trackedDayMirror.children {
                dayInt += 1
                if(dayInt == Calendar.current.component(.weekday, from: date) && day.value as! Bool == true) {
                    let event = Event()
                    
                    var startDate = date
                    startDate = Calendar.current.date(bySetting: .hour, value: Calendar.current.component(.hour, from: habit.reminderTime), of: startDate)!
                    startDate = Calendar.current.date(bySetting: .minute, value: Calendar.current.component(.minute, from: habit.reminderTime), of: startDate)!
                    
                    var endDate = date
                    endDate = Calendar.current.date(byAdding: .minute, value: 30, to: startDate)!
                    print(startDate, endDate)
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
