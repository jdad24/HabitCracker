//
//  JournalViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 3/14/23.
//

import UIKit

class JournalViewController: BaseViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    var habitList: [Habit]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        habitList = Habit.readHabitFile()
        
        navigationItem.title = "Journal"
        
        if #available(iOS 16.0, *) {
            let calendarView = CalendarView()
            calendarView.delegate = self
            let dateSelection = UICalendarSelectionSingleDate(delegate: self)
            calendarView.selectionBehavior = dateSelection
            
            view.addSubview(calendarView)
            
            calendarView.translatesAutoresizingMaskIntoConstraints = false
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            calendarView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            calendarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75).isActive = true
            calendarView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
        } else {
            // Fallback on earlier versions
        }

        // Do any additional setup after loading the view.
    }
    
    @available(iOS 16.0, *)
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        let weekday = Calendar.current.dateComponents([.weekday], from: dateComponents.date!).weekday
        
        for habit in habitList {
            let trackedDaysMirror = Mirror(reflecting: habit.trackedDays)
            var dayInt = 0 //Sunday = 1, Monday = 2,... Saturday = 7
            
            for child in trackedDaysMirror.children {
                dayInt += 1
                
                if(child.value as! Bool == true) {
                    if(weekday == dayInt) {
                        return UICalendarView.Decoration.default(color: .red, size: .large)
                    }
                }
            }
        }
        
        return UICalendarView.Decoration.default(color: .blue, size: .large)
    }
    
    @available(iOS 16.0, *)
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        // Return `true` to allow a date selection; a nil date clears the selection.
        // Require a date selection by returning false if dateComponents is nil.
        return dateComponents != nil
    }
    
    @available(iOS 16.0, *)
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
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
