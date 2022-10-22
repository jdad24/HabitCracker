//
//  DaySelectionView.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/18/22.
//

import UIKit

class DaySelectionView: UIView {
    
    var daysOfWeek = DaysOfWeek()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    init(daysofWeek: DaysOfWeek) {
        super.init(frame: .zero)
        createSubViews()
        self.daysOfWeek = daysofWeek
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
        
        let sundayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isSunday = !self.daysOfWeek.isSunday
        })
        sundayButton.setImage(sundaySymbol, for: .normal)
        sundayButton.setImage(sundaySymbolFill, for: .selected)

        let mondayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isMonday = !self.daysOfWeek.isMonday
        })
        mondayButton.setImage(mondaySymbol, for: .normal)
        mondayButton.setImage(mondaySymbolFill, for: .selected)
        
        let tuesdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isTuesday = !self.daysOfWeek.isTuesday
        })
        tuesdayButton.setImage(tuesdaySymbol, for: .normal)
        tuesdayButton.setImage(tuesdaySymbolFill, for: .selected)
        
        let wednesdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isWednesday = !self.daysOfWeek.isWednesday
        })
        wednesdayButton.setImage(wednesdaySymbol, for: .normal)
        wednesdayButton.setImage(wednesdaySymbolFill, for: .selected)
        
        let thursdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isThursday = !self.daysOfWeek.isThursday
        })
        thursdayButton.setImage(thursdaySymbol, for: .normal)
        thursdayButton.setImage(thursdaySymbolFill, for: .selected)
        
        let fridayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isFriday = !self.daysOfWeek.isFriday
        })
        fridayButton.setImage(fridaySymbol, for: .normal)
        fridayButton.setImage(fridaySymbolFill, for: .selected)
        
        let saturdayButton = UIButton(type: .custom, primaryAction: UIAction() {action in
            let button = action.sender as! UIButton
            button.isSelected = !button.isSelected
            self.daysOfWeek.isSaturday = !self.daysOfWeek.isSaturday
        })
        saturdayButton.setImage(saturdaySymbol, for: .normal)
        saturdayButton.setImage(saturdaySymbolFill, for: .selected)
        
//        addSubview(sundayButton)
//        addSubview(mondayButton)
//        addSubview(tuesdayButton)
//        addSubview(wednesdayButton)
//        addSubview(thursdayButton)
//        addSubview(fridayButton)
//        addSubview(saturdayButton)
        
//        sundayButton.translatesAutoresizingMaskIntoConstraints = false
//        mondayButton.translatesAutoresizingMaskIntoConstraints = false
//        tuesdayButton.translatesAutoresizingMaskIntoConstraints = false
//        wednesdayButton.translatesAutoresizingMaskIntoConstraints = false
//        thursdayButton.translatesAutoresizingMaskIntoConstraints = false
//        fridayButton.translatesAutoresizingMaskIntoConstraints = false
//        saturdayButton.translatesAutoresizingMaskIntoConstraints = false
        
//        sundayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        mondayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        tuesdayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        wednesdayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        thursdayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        fridayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        saturdayButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
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
        
//        sundayButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        mondayButton.leftAnchor.constraint(equalTo: sundayButton.rightAnchor, constant: 10).isActive = true
//        tuesdayButton.leftAnchor.constraint(equalTo: mondayButton.rightAnchor, constant: 10).isActive = true
//        wednesdayButton.leftAnchor.constraint(equalTo: tuesdayButton.rightAnchor, constant: 10).isActive = true
//        thursdayButton.leftAnchor.constraint(equalTo: wednesdayButton.rightAnchor, constant: 10).isActive = true
//        fridayButton.leftAnchor.constraint(equalTo: thursdayButton.rightAnchor, constant: 10).isActive = true
//        saturdayButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
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

