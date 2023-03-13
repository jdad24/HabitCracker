//
//  BubbleView.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 1/31/23.
//

import UIKit

class BubbleView: UIView {
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        frame.size.width = 150
        frame.size.height = 150
        
        self.backgroundColor = backgroundColor
        layer.cornerRadius =  layer.bounds.width/2
        clipsToBounds = true
        print("bubble intialized")
    }
    
    override func didMoveToSuperview() {
        animateBubble()
    }
    
    func animateBubble() {
        let bounceAnimation = CABasicAnimation(keyPath: "position.y")
        bounceAnimation.duration = 1
        bounceAnimation.fromValue = self.layer.position.y
        bounceAnimation.toValue = self.layer.position.y + 50
        bounceAnimation.repeatCount = Float.infinity
        bounceAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.duration = 3
        opacityAnimation.fromValue = 0
        opacityAnimation.toValue = 1
        
        layer.add(bounceAnimation, forKey: "position")
        layer.add(opacityAnimation, forKey: "opacity")
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
