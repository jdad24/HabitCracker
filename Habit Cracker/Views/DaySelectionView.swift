//
//  DaySelectionView.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/18/22.
//

import UIKit

class DaySelectionView: UIView {
    
    var trackedDays = TrackedDays()
    
    var sundayButton = UIButton()
    var mondayButton = UIButton()
    var tuesdayButton = UIButton()
    var wednesdayButton = UIButton()
    var thursdayButton = UIButton()
    var fridayButton = UIButton()
    var saturdayButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    init(trackedDays: TrackedDays) {
        super.init(frame: .zero)
        createSubViews()
        
        self.trackedDays = trackedDays
        
        isUserInteractionEnabled = false
        showTrackedDays()
    }
    
    private func showTrackedDays() {
        sundayButton.isSelected = trackedDays.isSunday ? true : false
        mondayButton.isSelected = trackedDays.isMonday ? true : false
        tuesdayButton.isSelected = trackedDays.isTuesday ? true : false
        wednesdayButton.isSelected = trackedDays.isWednesday ? true : false
        thursdayButton.isSelected = trackedDays.isThursday ? true : false
        fridayButton.isSelected = trackedDays.isFriday ? true : false
        saturdayButton.isSelected = trackedDays.isSaturday ? true : false
    }
    
    
    private func createSubViews() {
        let sundaySymbol = UIImage(systemName: "s.circle")
        let sundaySymbolFill = UIImage(systemName: "s.circle.fill")
        let mondaySymbol = UIImage(systemName: "m.circle")
        let mondaySymbolFill = UIImage(systemName: "m.circle.fill")
        let tuesdaySymbol = UIImage(systemName: "t.circle")
        let tuesdaySymbolFill = UIImage(systemName: "t.circle.fill")
        let wednesdaySymbol = UIImage(systemName: "w.circle")
        let wednesdaySymbolFill = UIImage(systemName: "w.circle.fill")
        let thursdaySymbol = UIImage(systemName: "t.circle")
        let thursdaySymbolFill = UIImage(systemName: "t.circle.fill")
        let fridaySymbol = UIImage(systemName: "f.circle")
        let fridaySymbolFill = UIImage(systemName: "f.circle.fill")
        let saturdaySymbol = UIImage(systemName: "s.circle")
        let saturdaySymbolFill = UIImage(systemName: "s.circle.fill")
        
        sundayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isSunday = !self.trackedDays.isSunday
        })
        sundayButton.setImage(sundaySymbol, for: .normal)
        sundayButton.setImage(sundaySymbolFill, for: .selected)

        mondayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isMonday = !self.trackedDays.isMonday
        })
        mondayButton.setImage(mondaySymbol, for: .normal)
        mondayButton.setImage(mondaySymbolFill, for: .selected)
        
        tuesdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isTuesday = !self.trackedDays.isTuesday
        })
        tuesdayButton.setImage(tuesdaySymbol, for: .normal)
        tuesdayButton.setImage(tuesdaySymbolFill, for: .selected)
        
        wednesdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isWednesday = !self.trackedDays.isWednesday
        })
        wednesdayButton.setImage(wednesdaySymbol, for: .normal)
        wednesdayButton.setImage(wednesdaySymbolFill, for: .selected)
        
        thursdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isThursday = !self.trackedDays.isThursday
        })
        thursdayButton.setImage(thursdaySymbol, for: .normal)
        thursdayButton.setImage(thursdaySymbolFill, for: .selected)
        
        fridayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isFriday = !self.trackedDays.isFriday
        })
        fridayButton.setImage(fridaySymbol, for: .normal)
        fridayButton.setImage(fridaySymbolFill, for: .selected)
        
        saturdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.trackedDays.isSaturday = !self.trackedDays.isSaturday
        })
        saturdayButton.setImage(saturdaySymbol, for: .normal)
        saturdayButton.setImage(saturdaySymbolFill, for: .selected)
        
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalSpacing
        horizontalStackView.addArrangedSubview(sundayButton)
        horizontalStackView.addArrangedSubview(mondayButton)
        horizontalStackView.addArrangedSubview(tuesdayButton)
        horizontalStackView.addArrangedSubview(wednesdayButton)
        horizontalStackView.addArrangedSubview(thursdayButton)
        horizontalStackView.addArrangedSubview(fridayButton)
        horizontalStackView.addArrangedSubview(saturdayButton)
        
        addSubview(horizontalStackView)
        
        horizontalStackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        horizontalStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        horizontalStackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
        horizontalStackView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor).isActive = true
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

