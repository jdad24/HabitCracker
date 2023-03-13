//
//  ViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/8/22.
//

import UIKit

class TodayViewController: BaseViewController {
    let timeLabel = UILabel()
    var habitList: [Habit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        enableConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createBubbleViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeBubbleViews()
    }
    
    func setup() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE \n MMMM dd, yyyy \n h:mm a"
        
        let date = dateFormater.string(from: Date())
        
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .center
        timeLabel.text = """
\(date)
"""
        
        view.addSubview(timeLabel)
    }
    
    func createBubbleViews() {
        let weekday = Calendar.current.component(.weekday, from: Date())
        habitList = Habit.readHabitFile()
        print(UIScreen.main.bounds)
        
        for habit in habitList {
            let trackedDaysMirror = Mirror(reflecting: habit.trackedDays)
            var dayInt = 0
            var dateComponent = DateComponents()
            dateComponent.calendar = Calendar.current

            for child in trackedDaysMirror.children {
                dayInt += 1

                if(child.value as! Bool == true && dayInt == weekday ) {
                    let bubbleView = BubbleView(backgroundColor: .purple)
                    bubbleView.layer.zPosition = -1
                    bubbleView.layer.position.x = Double.random(in: 50..<(view.frame.width-50.0))
                    bubbleView.layer.position.y = Double.random(in: 50..<(view.frame.height-50.0))
                    view.addSubview(bubbleView)
                }

            }
        }
    }
    
    func removeBubbleViews() {
        view.subviews.forEach({
            if($0 is BubbleView) {
                $0.removeFromSuperview()
            }
            })
    }
    
    override func viewWillAppear(_ animated: Bool) {
       navigationItem.title = "Today"
    }
    
    func enableConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        
    }


}

