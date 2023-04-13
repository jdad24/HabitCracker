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
        
        if(UITraitCollection.current.userInterfaceStyle == .dark) {
            table.backgroundColor = ThemeProperties.darkModeBackgroundColor
        } else {
            table.backgroundColor = ThemeProperties.lightModeBackgroundColor
        }
    }
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
    func setup() {
        view.addSubview(table)
        table.isScrollEnabled = true
        
        let createHabitAction = UIAction() { _ in
            self.navigationController?.pushViewController(CreateHabitViewController(), animated: true)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: createHabitAction)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func setConstraints() {
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
        
        habit.calculateDaysElapsed() //Calculate number of days since habit tracked

        cell.textLabel?.text = habit.habitName.capitalized
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.detailTextLabel?.text = "\(habit.daysElapsed) Days Elapsed"
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (actions, view, completionHander) in
            HabitNotifications.deleteLocal(habit: self.habitList[indexPath.section])
            
            self.habitList.remove(at: indexPath.section)
            let data = self.habitList.encode()
            do {
                try data.write(to: url.appendingPathComponent(TextFiles.habitListFile))
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
            self.navigationController?.pushViewController(EditHabitViewController(habit: self.habitList[indexPath.section], habitIndex: indexPath.section), animated: true)
            completionHander(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return table.frame.size.height/6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(EditHabitViewController(habit: self.habitList[indexPath.section], habitIndex: indexPath.section), animated: true)
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
