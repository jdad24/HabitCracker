//
//  EditHabitViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/6/22.
//

import UIKit

class EditHabitViewController: BaseViewController {
    var habit = Habit()
    
    let habitNameLabel = UILabel()
    let habitNameTextField = UITextField()
    
    let daysElapsedLabel = UILabel()
    let daysElapsedTextField = UITextField()
    
    let reminderLabel = UILabel()
    let reminderSwitch = UISwitch()
    
    init(habit: Habit) {
        super.init(nibName: nil, bundle: nil)
        self.habit = habit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Edit \(habit.habitName) Habit"
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameTextField)
        view.addSubview(daysElapsedLabel)
        view.addSubview(daysElapsedTextField)
        view.addSubview(reminderLabel)
        view.addSubview(reminderSwitch)
        
        habitNameLabel.text = "Habit Name"
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        habitNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        habitNameTextField.placeholder = String(habit.habitName) 
        habitNameTextField.translatesAutoresizingMaskIntoConstraints = false
        habitNameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        habitNameTextField.topAnchor.constraint(equalTo: habitNameLabel.topAnchor).isActive = true
        
        daysElapsedLabel.text = "Days Elapsed"
        daysElapsedLabel.translatesAutoresizingMaskIntoConstraints = false
        daysElapsedLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        daysElapsedLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 50).isActive = true
        
        daysElapsedTextField.placeholder = "\(String(habit.daysElapsed)) Days Elapsed"
        daysElapsedTextField.translatesAutoresizingMaskIntoConstraints = false
        daysElapsedTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        daysElapsedTextField.topAnchor.constraint(equalTo: daysElapsedLabel.topAnchor).isActive = true
        
        reminderLabel.text = "Set reminder?"
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        reminderLabel.topAnchor.constraint(equalTo: daysElapsedLabel.bottomAnchor, constant: 50).isActive = true
        
        reminderSwitch.isOn = habit.showReminder
        reminderSwitch.translatesAutoresizingMaskIntoConstraints = false
        reminderSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        reminderSwitch.topAnchor.constraint(equalTo: reminderLabel.topAnchor).isActive = true
        
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

