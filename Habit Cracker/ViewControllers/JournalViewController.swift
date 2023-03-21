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
        
        navigationItem.title = "Journal"
        //        habitList = Habit.readHabitFile()
        //        dayView.timelinePagerView.isHidden = true
        
        //        var style = CalendarStyle()
        //        style.header.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        //        style.timeline.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        //        dayView.updateStyle(style)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let habitList = Habit.readHabitFile() // Get events (models) from the storage / API
        print(date, Calendar.current.component(.weekday, from: date))
        
        var events = [Event]()
        let endDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())
        
        for habit in habitList {
            // Create new EventView
            let trackedDayMirror = Mirror(reflecting: habit.trackedDays)
            var dayInt = 0
            
            for day in trackedDayMirror.children {
                dayInt += 1
                if(dayInt == Calendar.current.component(.weekday, from: date) && day.value as! Bool == true) {
                    let event = Event()
                    event.dateInterval = DateInterval(start: habit.reminderDate, end: endDate!)
                    
                    let info = [habit.habitName, String(habit.daysElapsed)]
                    event.text = info.reduce("", {$0 + $1 + "\n"})
                    events.append(event)
                }
            }
        }
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
