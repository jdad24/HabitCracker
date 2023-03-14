//
//  JournalViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 3/14/23.
//

import UIKit

class JournalViewController: BaseViewController, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            calendarView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        } else {
            // Fallback on earlier versions
        }

        // Do any additional setup after loading the view.
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
