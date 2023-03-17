//
//  CalendarView.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 3/14/23.
//

import UIKit

@available(iOS 16.0, *)
class CalendarView: UICalendarView {
    var habitList: [Habit]!
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        fontDesign = .rounded
        layer.borderColor = CGColor(red: 0.2, green: 0.2, blue: 0.7, alpha: 1.0)
        layer.borderWidth = 3
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
