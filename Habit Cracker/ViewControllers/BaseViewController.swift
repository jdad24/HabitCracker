//
//  BaseViewController.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 10/6/22.
//

import UIKit

class BaseViewController: UIViewController {
    let themeControl = ThemeControl()
    var darkMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(darkMode) {
            view.backgroundColor = ThemeControl.darkModeBackgroundColor
            UILabel.appearance().textColor = ThemeControl.darkModeTextColor
        } else {
            view.backgroundColor = ThemeControl.lightModeBackgroundColor
            UILabel.appearance().textColor = ThemeControl.lightModeTextColor
        }
        
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
