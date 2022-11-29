//
//  ViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/8/22.
//

import UIKit

class TodayViewController: BaseViewController {
    let timeLabel = UILabel()
    
//    var currentTime = Calendar.current.dateComponents([.month, .day, .year, .hour, .minute], from: Date())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        currentTime = Calendar.current.dateComponents([.month, .day, .year, .hour, .minute], from: Date())
        setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        enableConstraints()
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

