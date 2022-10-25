//
//  SettingsViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/22/22.
//

import UIKit

class SettingsViewController: BaseViewController {
    let darkModeLabel = UILabel()
    let darkModeSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        darkModeLabel.text = "Dark Mode"
        
        darkModeLabel.backgroundColor = .red
        darkModeSwitch.backgroundColor = .blue
        
        view.addSubview(darkModeLabel)
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkModeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        darkModeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        darkModeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        darkModeLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(darkModeSwitch)
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        darkModeSwitch.topAnchor.constraint(equalTo: darkModeLabel.topAnchor, constant: 0).isActive = true
        darkModeSwitch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        darkModeSwitch.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        // Do any additional setup after loading the view.
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
