//
//  JournalViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 3/14/23.
//

import UIKit

class JournalViewController: BaseViewController, UICalendarViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Journal"
        
        if #available(iOS 16.0, *) {
            let calendarView = UICalendarView()
            calendarView.delegate = self
            calendarView.backgroundColor = .white
            calendarView.fontDesign = .rounded
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
