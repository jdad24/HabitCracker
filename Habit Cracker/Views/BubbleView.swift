//
//  BubbleView.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 1/31/23.
//

import UIKit

class BubbleView: UIView {
    var habitName = String()
    let habitLabel = UILabel()
    let daysLabel = UILabel()
    var animate: Bool = true
    var index = 0
    
    init(backgroundColor: UIColor, habit: Habit, animate: Bool, index: Int) {
        super.init(frame: .zero)
        frame.size.width = 150
        frame.size.height = 150
        
        self.animate = animate
        
        self.backgroundColor = backgroundColor
        layer.cornerRadius =  layer.bounds.width/2
        clipsToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        habitLabel.text = habit.habitName
        
        habit.calculateDaysElapsed()
        daysLabel.font = UIFont.systemFont(ofSize: 12)
        daysLabel.text = String(habit.daysElapsed) + " Days"
    }
    
    override func didMoveToSuperview() {
        addSubview(habitLabel)
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        habitLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        habitLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        addSubview(daysLabel)
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 15).isActive = true
        daysLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        daysLabel.layer.zPosition = -10
        
        animate ? animateBubble() : nil
    }
    
    func animateBubble() {
        let bounceAnimation = CABasicAnimation(keyPath: "position.y")
        bounceAnimation.duration = 1
        bounceAnimation.fromValue = self.layer.position.y
        bounceAnimation.toValue = self.layer.position.y + 50
        bounceAnimation.repeatCount = Float.infinity
        bounceAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.duration = 2
        opacityAnimation.fromValue = 0
        opacityAnimation.toValue = 1
        opacityAnimation.autoreverses = true
        opacityAnimation.repeatCount = Float.infinity
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 1.5
        scaleAnimation.fromValue = 0.75
        scaleAnimation.toValue = 1.0
        scaleAnimation.repeatCount = Float.infinity
        scaleAnimation.autoreverses = true
        
        layer.add(bounceAnimation, forKey: "position")
        layer.add(opacityAnimation, forKey: "opacity")
        layer.add(scaleAnimation, forKey: "scale")
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
