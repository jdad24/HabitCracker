//
//  EditHabitViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/6/22.
//

import UIKit

class EditHabitViewController: BaseViewController {
    var habit = Habit()
    var habitIndex = Int()
    
    let habitNameLabel = UILabel()
    let habitNameTextField = UITextField()
    
    let daysElapsedLabel = UILabel()
    let daysElapsedValueLabel = UILabel()
    
    let reminderLabel = UILabel()
    let reminderSwitch = UISwitch()
    
    var editButton = UIButton()
    let pencilImage = UIImage(systemName: "pencil")
    
    init(habit: Habit, habitIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.habit = habit
        self.habitIndex = habitIndex
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = habit.habitName.capitalized
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        habitNameTextField.textColor = .white
        
        editButton = UIButton(primaryAction: UIAction() { action in
            self.habit.habitName = self.habitNameTextField.text ?? ""
            self.habit.showReminder = self.reminderSwitch.isOn
            
            Habit.updateHabit(self.habit, habitIndex: self.habitIndex)
            self.habit.showReminder ? nil : HabitNotifications.deleteLocal(habit: self.habit)
            self.navigationController?.popViewController(animated: true)
        })
        
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameTextField)
        view.addSubview(daysElapsedLabel)
        view.addSubview(daysElapsedValueLabel)
        view.addSubview(reminderLabel)
        view.addSubview(reminderSwitch)
        view.addSubview(editButton)
        
        habitNameLabel.text = "Habit Name"
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        habitNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        habitNameTextField.text = habit.habitName.capitalized
        habitNameTextField.translatesAutoresizingMaskIntoConstraints = false
        habitNameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        habitNameTextField.topAnchor.constraint(equalTo: habitNameLabel.topAnchor).isActive = true
        
        daysElapsedLabel.text = "Days Cracked"
        daysElapsedLabel.translatesAutoresizingMaskIntoConstraints = false
        daysElapsedLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        daysElapsedLabel.topAnchor.constraint(equalTo: habitNameTextField.bottomAnchor, constant: 50).isActive = true
        
        daysElapsedValueLabel.text = "\(habit.daysElapsed)"
        daysElapsedValueLabel.translatesAutoresizingMaskIntoConstraints = false
        daysElapsedValueLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        daysElapsedValueLabel.topAnchor.constraint(equalTo: daysElapsedLabel.topAnchor).isActive = true
    
        reminderLabel.text = "Set reminder?"
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        reminderLabel.topAnchor.constraint(equalTo: daysElapsedLabel.bottomAnchor, constant: 50).isActive = true
        
        reminderSwitch.isOn = habit.showReminder
        reminderSwitch.translatesAutoresizingMaskIntoConstraints = false
        reminderSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        reminderSwitch.topAnchor.constraint(equalTo: reminderLabel.topAnchor).isActive = true
        
        editButton.setImage(pencilImage, for: .normal)
        editButton.backgroundColor = .clear
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        editButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05).isActive = true
        editButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        editButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

