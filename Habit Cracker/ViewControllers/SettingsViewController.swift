//
//  SettingsViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/22/22.
//

import UIKit
import os

class SettingsViewController: BaseViewController {
    
    let darkModeLabel = UILabel()
    let darkModeSwitch = UISwitch()
    
    let saveButton = UIButton()
    let saveImage = UIImage(systemName: "square.and.arrow.down.fill")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        darkModeLabel.text = "Dark Mode"
        saveButton.setImage(saveImage, for: .normal)
        saveButton.contentVerticalAlignment = .fill
        saveButton.contentHorizontalAlignment = .fill
        saveButton.imageView?.contentMode = .scaleAspectFit
        saveButton.addAction(UIAction() { _ in
            self.logger.info("Settings saved")
        }, for: .touchUpInside)
        
        view.addSubview(darkModeLabel)
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkModeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        darkModeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        darkModeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        darkModeLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(darkModeSwitch)
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        darkModeSwitch.centerYAnchor.constraint(equalTo: darkModeLabel.centerYAnchor, constant: 30).isActive = true
        darkModeSwitch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        darkModeSwitch.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.15).isActive = true
        saveButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        
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
