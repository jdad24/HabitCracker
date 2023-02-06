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
        
        self.backgroundColor = backgroundColor
        layer.cornerRadius =  layer.bounds.width/2
        clipsToBounds = true
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
