//
//  HabitTableViewCell.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/16/22.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
//    override var frame: CGRect {
//            get {
//                return super.frame
//            }
//            set (newFrame) {
//                var frame = newFrame
//                let newWidth = frame.width * 0.80 // get 80% width here
//                let space = (frame.width - newWidth) / 2
//                frame.size.width = newWidth
//                frame.origin.x += space
//
//                super.frame = frame
//
//            }
//        }
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, habit: Habit) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        textLabel?.textColor = .white
        detailTextLabel?.textColor = .white
        
        let daySelectionView = DaySelectionView(trackedDays: habit.trackedDays)
        let trackedDaysLabel = UILabel()
        trackedDaysLabel.text = "Tracked Days"
        trackedDaysLabel.textAlignment = .center
        
//        self.layer.borderColor = UIColor(displayP3Red: 100/255, green: 45/255, blue: 175/255, alpha: 1.0).cgColor
//        self.layer.borderWidth = 3
        self.layer.cornerRadius = 0.1 * self.frame.width
        self.clipsToBounds = true
        
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 0
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        textLabel?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        textLabel?.textAlignment = .center
        
        
        addSubview(daySelectionView)
        daySelectionView.translatesAutoresizingMaskIntoConstraints = false
        daySelectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        daySelectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        daySelectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        daySelectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
