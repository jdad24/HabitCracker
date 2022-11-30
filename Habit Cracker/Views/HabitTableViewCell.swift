//
//  HabitTableViewCell.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/16/22.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, habit: Habit) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        textLabel?.textColor = .white
        detailTextLabel?.textColor = .white
        
        let daySelectionView = DaySelectionView(trackedDays: habit.trackedDays)
        let trackedDaysLabel = UILabel()
        trackedDaysLabel.text = "Tracked Days"
        trackedDaysLabel.textAlignment = .center
        
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
    
    override func setNeedsLayout() {
        self.layer.cornerRadius = 0.1 * self.frame.width
        self.clipsToBounds = true
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
