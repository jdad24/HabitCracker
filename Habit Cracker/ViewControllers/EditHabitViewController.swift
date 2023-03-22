//
//  EditHabitViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/6/22.
//

import UIKit

class EditHabitViewController: BaseViewController, UITextFieldDelegate {
    var habit = Habit()
    var habitIndex = Int()
    
    let habitNameLabel = UILabel()
    let habitNameTextField = UITextField()
    
    let daySelectionLabel = UILabel()
    var daySelectionView: DaySelectionView!
    
    let daysElapsedLabel = UILabel()
    let daysElapsedValueLabel = UILabel()
    
    let reminderLabel = UILabel()
    let reminderSwitch = UISwitch()
    
    var setReminderTime: Bool = false
    let reminderDatePicker = UIDatePicker()
    
    var editButton = UIButton()
    let pencilImage = UIImage(systemName: "pencil")
    
    init(habit: Habit, habitIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.habit = habit
        self.habitIndex = habitIndex
        
        daySelectionView = DaySelectionView(trackedDays: self.habit.trackedDays)
        daySelectionView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        navigationItem.title = habit.habitName.capitalized
        
        habitNameTextField.delegate = self
        habitNameTextField.returnKeyType = .done
        habitNameTextField.textColor = .white
        
        reminderDatePicker.accessibilityIdentifier = "reminderDatePicker"
        reminderDatePicker.datePickerMode = UIDatePicker.Mode.time
        
        reminderSwitch.addTarget(self, action: #selector(onReminderSwitchValueChange), for: .valueChanged)
        
        editButton = UIButton(primaryAction: UIAction() { action in
            self.habit.habitName = self.habitNameTextField.text ?? ""
            
            self.habit.showReminder = self.reminderSwitch.isOn
            
            let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: self.reminderDatePicker.date)
            self.habit.reminderHour = timeComponents.hour ?? 6
            self.habit.reminderMinute = timeComponents.minute ?? 0
            self.habit.reminderTime = self.reminderDatePicker.date
            
            self.habit.trackedDays = self.daySelectionView.trackedDays
            
            if self.habit.habitName.isEmpty {
                let alertVC = UIAlertController(title: "Please choose a title for the habit", message: nil, preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .default))
                alertVC.modalPresentationStyle = UIModalPresentationStyle.popover
                self.present(alertVC, animated: true)
                return
            }
            
            Habit.updateHabit(self.habit, habitIndex: self.habitIndex)
            
            if(self.habit.showReminder) {
                HabitNotifications.deleteLocal(habit: self.habit)
                HabitNotifications.scheduleLocal(habit: self.habit)
            } else {
                HabitNotifications.deleteLocal(habit: self.habit)
            }
            
            self.navigationController?.popViewController(animated: true)
        })
        
        view.addSubview(habitNameLabel)
        view.addSubview(habitNameTextField)
        view.addSubview(daySelectionLabel)
        view.addSubview(daySelectionView)
        view.addSubview(daysElapsedLabel)
        view.addSubview(daysElapsedValueLabel)
        view.addSubview(reminderLabel)
        view.addSubview(reminderSwitch)
        view.addSubview(editButton)
        
        habitNameLabel.text = "Habit Name"
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        habitNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        habitNameTextField.text = habit.habitName.capitalized
        habitNameTextField.translatesAutoresizingMaskIntoConstraints = false
        habitNameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        habitNameTextField.topAnchor.constraint(equalTo: habitNameLabel.topAnchor).isActive = true
        
        daySelectionLabel.text = "Select Days to Track"
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
        
        daysElapsedLabel.text = "Days Cracked"
        daysElapsedLabel.translatesAutoresizingMaskIntoConstraints = false
        daysElapsedLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        daysElapsedLabel.topAnchor.constraint(equalTo: daySelectionLabel.bottomAnchor, constant: 50).isActive = true
        
        daysElapsedValueLabel.text = "\(habit.daysElapsed)"
        daysElapsedValueLabel.translatesAutoresizingMaskIntoConstraints = false
        daysElapsedValueLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        daysElapsedValueLabel.topAnchor.constraint(equalTo: daysElapsedLabel.topAnchor).isActive = true
    
        reminderLabel.text = "Set reminder?"
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        reminderLabel.topAnchor.constraint(equalTo: daysElapsedLabel.bottomAnchor, constant: 50).isActive = true
        
        reminderSwitch.isOn = habit.showReminder
        reminderSwitch.translatesAutoresizingMaskIntoConstraints = false
        reminderSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        reminderSwitch.topAnchor.constraint(equalTo: reminderLabel.topAnchor).isActive = true
        
        reminderSwitch.isOn ? showReminderDatePicker() : nil
        
        editButton.setImage(pencilImage, for: .normal)
        editButton.backgroundColor = .clear
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        editButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05).isActive = true
        editButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        editButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    
    @objc func onReminderSwitchValueChange() {
        habit.showReminder = reminderSwitch.isOn
        setReminderTime = reminderSwitch.isOn
        
        setReminderTime ? showReminderDatePicker(): removeReminderDatePicker()
    }
    
    func showReminderDatePicker() {
        
        reminderDatePicker.backgroundColor = .white
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

