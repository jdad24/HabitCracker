//
//  ViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/8/22.
//

import UIKit

class TodayViewController: BaseViewController, UICollisionBehaviorDelegate {
    let timeLabel = UILabel()
    var habitList: [Habit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Today"
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
//        enableConstraints()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        createBubbleViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeBubbleViews()
    }
    
    func createBubbleViews() {
        let weekday = Calendar.current.component(.weekday, from: Date())
        habitList = Habit.readHabitFile()
        
        let bubblecolors: [UIColor] = [.purple, .magenta]
        
        for (index, habit) in habitList.enumerated() {
            let trackedDaysMirror = Mirror(reflecting: habit.trackedDays)
            var dayInt = 0
            var dateComponent = DateComponents()
            dateComponent.calendar = Calendar.current

            for child in trackedDaysMirror.children {
                dayInt += 1

                if(child.value as! Bool == true && dayInt == weekday ) {
                    let color = bubblecolors[Int.random(in: 0..<2)]
                    
                    let bubbleView = BubbleView(backgroundColor: color, habit: habit, animate: true, index: index)
                    bubbleView.layer.zPosition = -1
                    bubbleView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                    bubbleView.layer.position.x = Double.random(in: (bubbleView.frame.size.width*0.75)..<(view.frame.width-bubbleView.frame.size.width*0.75))
                    bubbleView.layer.position.y = Double.random(in: (bubbleView.frame.size.height*0.75)..<(view.frame.height-bubbleView.frame.size.height*0.75))
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
    
    func enableConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        
    }
}

