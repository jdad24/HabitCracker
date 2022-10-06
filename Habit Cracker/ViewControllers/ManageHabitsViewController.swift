//
//  ManageHabitsViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/9/22.
//

import UIKit

class ManageHabitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let table = UITableView()
    var habitList: [Habit]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        habitList = readHabitFile()
        print(habitList ?? "empty" )
        table.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        enableConstraints()
    }
    
    func setup() {
        navigationItem.title = "Manage Habits"
        view.backgroundColor = .white
        view.addSubview(table)
        
        table.isScrollEnabled = true
        
        let addHabitAction = UIAction() { _ in
            self.navigationController?.pushViewController(CreateHabitViewController(), animated: true)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addHabitAction)
    }
    
    func enableConstraints() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func readHabitFile() -> [Habit]? {
        do {
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            let fileName = "HabitList.txt"
            
            let data = try Data(contentsOf: url.appendingPathComponent(fileName))
            
            guard let decodedHabit = Habit.decode(data: data) else {return nil}
            
            return decodedHabit 
                  
        } catch {
            print("ERROR M: ", error)
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "HabitCell")
        cell.detailTextLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.text = """
Habit: \(habitList?[indexPath.row].habitName ?? "Empty")
Set Reminder? \(habitList?[indexPath.row].showReminder ?? false ? "Yes" : "No")
"""
        
        return cell
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
