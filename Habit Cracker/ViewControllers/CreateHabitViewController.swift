//
//  CreateHabitViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/10/22.
//

import UIKit

class CreateHabitViewController: UIViewController, UITextFieldDelegate {
    var habit = Habit()
    
    let habitNameLabel = UILabel()
    let habitNameTextTield = UITextField()
    
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
        view.backgroundColor = .white
        navigationItem.title = "Create Your Habit"
        
        reminderSwitch.addTarget(self, action: #selector(onReminderSwitchValueChange), for: .valueChanged)
        
        habitNameLabel.text = "Habit"
        reminderLabel.text = "Set Reminder?"
        
        habitNameTextTield.placeholder = "Enter your habit"
        habitNameTextTield.textAlignment = .right
        
        submitButton = UIButton(primaryAction: UIAction() {_ in
            self.saveHabit(self.habit.habitName, self.habit.showReminder)
            
            self.navigationController?.popViewController(animated: true)
        })
        submitButton.setTitle("Create Habit", for: UIControl.State.normal)
        submitButton.setTitleColor(.white, for: UIControl.State.normal)
        submitButton.backgroundColor = .blue
       
        
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameTextTield)
        view.addSubview(reminderLabel)
        view.addSubview(reminderSwitch)
        view.addSubview(submitButton)
    }
    
    @objc func onReminderSwitchValueChange() {
        habit.showReminder = reminderSwitch.isOn
    }
    
    func saveHabit(_ habitName: String, _ showReminder: Bool) {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileName = "HabitList.txt"
        var habitList = [Habit]()
        
        
        do {
            let previous = try Data(contentsOf: url.appendingPathComponent(fileName))
            if let previousDecoded = Habit.decode(data: previous){
                habitList = previousDecoded
                habitList.append(habit)
                print(habitList)
            
                let encodedHabitList = habitList.encode()
                try encodedHabitList.write(to: url.appendingPathComponent(fileName))
            } else {
                habitList.append(habit)
                let encodedHabitList = habitList.encode()
                try encodedHabitList.write(to: url.appendingPathComponent(fileName))
            }
            
            } catch {
                print("ERROR: ", error)
                return
        }
        
    }
    
    func enableConstraints() {
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        habitNameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        habitNameTextTield.translatesAutoresizingMaskIntoConstraints = false
        habitNameTextTield.centerYAnchor.constraint(equalTo: habitNameLabel.centerYAnchor).isActive = true
        habitNameTextTield.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        habitNameTextTield.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        reminderLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 30).isActive = true
        
        reminderSwitch.translatesAutoresizingMaskIntoConstraints = false
        reminderSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        reminderSwitch.centerYAnchor.constraint(equalTo: reminderLabel.centerYAnchor).isActive = true
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
