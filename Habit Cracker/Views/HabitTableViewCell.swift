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
        
        let daySelectionView = DaySelectionView(trackedDays: habit.trackedDays)
        let trackedDaysLabel = UILabel()
        trackedDaysLabel.text = "Tracked Days"
        trackedDaysLabel.textAlignment = .center
        
        self.layer.borderColor = UIColor(displayP3Red: 100/255, green: 45/255, blue: 175/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 0.25 * self.frame.width
        self.clipsToBounds = true
        
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 0
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        textLabel?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        textLabel?.textAlignment = .center
        
        
        addSubview(daySelectionView)
        daySelectionView.translatesAutoresizingMaskIntoConstraints = false
        daySelectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        daySelectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        daySelectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        daySelectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        addSubview(trackedDaysLabel)
        trackedDaysLabel.translatesAutoresizingMaskIntoConstraints = false
        trackedDaysLabel.bottomAnchor.constraint(equalTo: daySelectionView.topAnchor, constant: 10).isActive = true
        trackedDaysLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        trackedDaysLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        trackedDaysLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
//        backgroundColor = UIColor(displayP3Red: 80/255, green: 80/255, blue: 80/255, alpha: 1.0)
        
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
