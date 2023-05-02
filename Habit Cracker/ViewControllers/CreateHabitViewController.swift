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
    let habitNameTextField = UITextField()
    
    let daySelectionLabel = UILabel()
    let daySelectionView = DaySelectionView(frame: .zero)
    
    let showDaysElapsedLabel = UILabel()
    let showDaysElapsedSwitch = UISwitch()
    
    let reminderLabel = UILabel()
    let reminderSwitch = UISwitch()
    
    var setReminderTime: Bool = false
    let reminderDatePicker = UIDatePicker()
    
    var submitButton: UIButton!
    let plusImage = UIImage(systemName: "plus")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        habitNameTextField.delegate = self
        habitNameTextField.returnKeyType = UIReturnKeyType.done
        
        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
    func showReminderDatePicker() {
        view.addSubview(reminderDatePicker)

        reminderDatePicker.translatesAutoresizingMaskIntoConstraints = false
        reminderDatePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        reminderDatePicker.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func removeReminderDatePicker() {
        view.subviews.forEach({
            if($0.accessibilityIdentifier == "reminderDatePicker"){
                $0.removeFromSuperview()
            }
        })
    }
    
    func setup() {
        navigationItem.title = "Create Habit"
        
        reminderDatePicker.accessibilityIdentifier = "reminderDatePicker"
        reminderDatePicker.datePickerMode = UIDatePicker.Mode.time
    
        habitNameLabel.text = "Habit"
        daySelectionLabel.text = "Select Days to Track"
        reminderLabel.text = "Set Reminder?"
        showDaysElapsedLabel.text = "Show Days Elapsed"
        
        habitNameTextField.placeholder = "Enter your habit"
        habitNameTextField.textAlignment = .right
        
        if(UITraitCollection.current.userInterfaceStyle == .dark) {
            view.backgroundColor = ThemeProperties.darkModeBackgroundColor
            UILabel.appearance().textColor = ThemeProperties.darkModeTextColor
            UITextField.appearance().textColor = ThemeProperties.darkModeTextColor
            habitNameTextField.attributedPlaceholder = NSAttributedString(string: habitNameTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.5)])
        } else {
            view.backgroundColor = ThemeProperties.lightModeBackgroundColor
            UILabel.appearance().textColor = ThemeProperties.lightModeTextColor
            UITextField.appearance().textColor = ThemeProperties.lightModeTextColor
            habitNameTextField.attributedPlaceholder = NSAttributedString(string: habitNameTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)])
        }
        
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
            self.habit.notificationIdentifier = UUID().uuidString //Creates a UUID for each created habit
            
            let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: self.reminderDatePicker.date)
            self.habit.reminderTime = self.reminderDatePicker.date
            self.habit.reminderHour = timeComponents.hour ?? 6
            self.habit.reminderMinute = timeComponents.minute ?? 0
            
            Habit.saveHabit(self.habit)
        
            self.habit.showReminder ? HabitNotifications.scheduleLocal(habit: self.habit) : print("No Schedule")
            self.navigationController?.popViewController(animated: true)
            
        })

        submitButton.setImage(plusImage, for: .normal)
        submitButton.setTitleColor(.white, for: UIControl.State.normal)
        submitButton.backgroundColor = .clear
        
        reminderSwitch.addTarget(self, action: #selector(onReminderSwitchValueChange), for: .valueChanged)
        showDaysElapsedSwitch.addTarget(self, action: #selector(onDaysElapsedSwitchValueChange), for: .valueChanged)
       
        
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameTextField)
        view.addSubview(daySelectionLabel)
        view.addSubview(daySelectionView)
        view.addSubview(showDaysElapsedLabel)
        view.addSubview(showDaysElapsedSwitch)
        view.addSubview(reminderLabel)
        view.addSubview(reminderSwitch)
        view.addSubview(submitButton)
    }
    
    @objc func onReminderSwitchValueChange() {
        habit.showReminder = reminderSwitch.isOn
        setReminderTime = reminderSwitch.isOn
        
        setReminderTime ? showReminderDatePicker(): removeReminderDatePicker()
    }
    
    @objc func onDaysElapsedSwitchValueChange() {
        habit.showDaysElapsed = showDaysElapsedSwitch.isOn
    }
    
    func setConstraints() {
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        habitNameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        habitNameTextField.translatesAutoresizingMaskIntoConstraints = false
        habitNameTextField.centerYAnchor.constraint(equalTo: habitNameLabel.centerYAnchor).isActive = true
        habitNameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        habitNameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        
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
        
        showDaysElapsedLabel.translatesAutoresizingMaskIntoConstraints = false
        showDaysElapsedLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        showDaysElapsedLabel.topAnchor.constraint(equalTo: daySelectionView.bottomAnchor, constant: 30).isActive = true
        
        showDaysElapsedSwitch.translatesAutoresizingMaskIntoConstraints = false
        showDaysElapsedSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        showDaysElapsedSwitch.centerYAnchor.constraint(equalTo: showDaysElapsedLabel.centerYAnchor).isActive = true
        
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        reminderLabel.topAnchor.constraint(equalTo: showDaysElapsedLabel.bottomAnchor, constant: 30).isActive = true
        
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
            self.habit.habitName = habitName.capitalized
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
