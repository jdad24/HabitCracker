//
//  ManageHabitsViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/9/22.
//

import UIKit

class ManageHabitsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    let table = UITableView()
    var habitList: [Habit] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        habitList = Habit.readHabitFile()
        table.reloadData()
        
        navigationItem.title = "Manage Habits"
        
    }
    
    override func viewDidLayoutSubviews() {
        enableConstraints()
    }
    
    func setup() {
        view.addSubview(table)
        
        table.isScrollEnabled = true
//        table.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8)
        
        let createHabitAction = UIAction() { _ in
            self.navigationController?.pushViewController(CreateHabitViewController(), animated: true)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: createHabitAction)
    }
    
    func enableConstraints() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        habitList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habit = habitList[indexPath.section]
        let cell = HabitTableViewCell(style: .subtitle, reuseIdentifier: "HabitCell", habit: habit)
        
        habit.calculateDaysElapsed()

        cell.textLabel?.text = habit.habitName
        cell.detailTextLabel?.text = """
Days Cracked: \(habit.daysElapsed)
Set Reminder? \(habit.showReminder ? "Yes" : "No")
"""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "HabitList.txt"
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (actions, view, completionHander) in
            self.habitList.remove(at: indexPath.section)
            let data = self.habitList.encode()
            do {
                try data.write(to: url.appendingPathComponent(fileName))
                self.table.reloadData()
                completionHander(true)
            } catch {
                print(error)
            }
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHander) in
            self.navigationController?.pushViewController(EditHabitViewController(habit: self.habitList[indexPath.section]), animated: true)
            completionHander(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return table.frame.size.height/4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        habitList[indexPath.section].calculateDaysElapsed()
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
