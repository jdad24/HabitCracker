//
//  Theme.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 3/25/23.
//

import Foundation
import UIKit

struct ThemeProperties {
    static let darkModeBackgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    static let darkModeTextColor = UIColor.white
    static let darkModeCellBackgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
    static let darkModeCellTextColor = UIColor.white
    
    static let lightModeBackgroundColor = UIColor.white
    static let lightModeTextColor = UIColor.black
    static let lightModeCellBackgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
    static let lightModeCellTextColor = UIColor.black
}

struct Theme: Codable {
    var darkMode = true
}

