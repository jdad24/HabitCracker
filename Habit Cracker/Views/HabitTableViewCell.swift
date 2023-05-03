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
        
        if(UITraitCollection.current.userInterfaceStyle == .dark) {
            self.backgroundColor = ThemeProperties.darkModeCellBackgroundColor
            textLabel?.textColor = ThemeProperties.darkModeCellTextColor
            detailTextLabel?.textColor = ThemeProperties.darkModeCellTextColor
        } else {
            self.backgroundColor = ThemeProperties.lightModeCellBackgroundColor
            textLabel?.textColor = ThemeProperties.lightModeCellTextColor
            detailTextLabel?.textColor = ThemeProperties.lightModeCellTextColor
        }
        
        let daySelectionView = DaySelectionView(trackedDays: habit.trackedDays)
        let trackedDaysLabel = UILabel()
        trackedDaysLabel.text = "Tracked Days"
        trackedDaysLabel.textAlignment = .center
        
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20)
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        textLabel?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        textLabel?.textAlignment = .center
        
        detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel?.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        detailTextLabel?.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
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
