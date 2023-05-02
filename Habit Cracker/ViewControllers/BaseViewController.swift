//
//  BaseViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/6/22.
//

import UIKit
import os

class BaseViewController: UIViewController {
    let logger = Logger()
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(UITraitCollection.current.userInterfaceStyle == .dark) {
            view.backgroundColor = ThemeProperties.darkModeBackgroundColor
            UILabel.appearance().textColor = ThemeProperties.darkModeTextColor
            UITextField.appearance().textColor = ThemeProperties.darkModeTextColor
        } else {
            view.backgroundColor = ThemeProperties.lightModeBackgroundColor
            UILabel.appearance().textColor = ThemeProperties.lightModeTextColor
            UITextField.appearance().textColor = ThemeProperties.lightModeTextColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
