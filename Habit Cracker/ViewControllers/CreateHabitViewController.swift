//
//  CreateHabitViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/10/22.
//

import UIKit

class CreateHabitViewController: BaseViewController, UITextFieldDelegate {
    var habit = Habit()
    
    let habitNameLabel = UILabel()
    let habitNameTextTield = UITextField()
    
    let daySelectionLabel = UILabel()
    let daySelectionView = DaySelectionView(frame: .zero)
    
    let reminderLabel = UILabel()
    let reminderSwitch = UISwitch()
    
    var submitButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        habitNameTextTield.delegate = self
        habitNameTextTield.returnKeyType = UIReturnKeyType.done
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        enableConstraints()
    }
    
    func setup() {
        navigationItem.title = "Create Habit"
    
        habitNameLabel.text = "Habit"
        daySelectionLabel.text = "Select Days to Track"
        reminderLabel.text = "Set Reminder?"
        
        habitNameTextTield.placeholder = "Enter your habit"
        habitNameTextTield.textAlignment = .right
        
        submitButton = UIButton(primaryAction: UIAction() {_ in
            if self.habit.habitName.isEmpty {
                let alertVC = UIAlertController(title: "Please choose a title for the habit", message: nil, preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .default))
                alertVC.modalPresentationStyle = UIModalPresentationStyle.popover
                self.present(alertVC, animated: true)
                return
            }
            
            self.habit.startDate = Date()
            self.habit.trackedDays = self.daySelectionView.trackedDays
            Habit.saveHabit(self.habit)
            self.navigationController?.popViewController(animated: true)
        })
        submitButton.setTitle("Create Habit", for: UIControl.State.normal)
        submitButton.setTitleColor(.white, for: UIControl.State.normal)
        submitButton.backgroundColor = .blue
        
        reminderSwitch.addTarget(self, action: #selector(onReminderSwitchValueChange), for: .valueChanged)
       
        
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameTextTield)
        
        view.addSubview(daySelectionLabel)
        view.addSubview(daySelectionView)
        
        view.addSubview(reminderLabel)
        view.addSubview(reminderSwitch)
        
        view.addSubview(submitButton)
    }
    
    @objc func onReminderSwitchValueChange() {
        habit.showReminder = reminderSwitch.isOn
    }
    
    func enableConstraints() {
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        habitNameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        habitNameTextTield.translatesAutoresizingMaskIntoConstraints = false
        habitNameTextTield.centerYAnchor.constraint(equalTo: habitNameLabel.centerYAnchor).isActive = true
        habitNameTextTield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        habitNameTextTield.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        
        daySelectionLabel.translatesAutoresizingMaskIntoConstraints = false
        daySelectionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        daySelectionLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 30).isActive = true
        daySelectionLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4).isActive = true
        daySelectionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        daySelectionView.translatesAutoresizingMaskIntoConstraints = false
        daySelectionView.leftAnchor.constraint(equalTo: daySelectionLabel.rightAnchor, constant: 0).isActive = true
        daySelectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        daySelectionView.centerYAnchor.constraint(equalTo: daySelectionLabel.centerYAnchor).isActive = true
        daySelectionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        reminderLabel.topAnchor.constraint(equalTo: daySelectionLabel.bottomAnchor, constant: 30).isActive = true
        
        reminderSwitch.translatesAutoresizingMaskIntoConstraints = false
        reminderSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        reminderSwitch.centerYAnchor.constraint(equalTo: reminderLabel.centerYAnchor).isActive = true
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        submitButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        submitButton.layer.cornerRadius = 0.25 * submitButton.frame.width
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let habitName = textField.text {
            self.habit.habitName = habitName
        }
        
        return true
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
