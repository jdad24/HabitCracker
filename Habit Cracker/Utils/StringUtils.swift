//
//  StringUtils.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 11/8/22.
//

import Foundation

extension String {
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }

    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
}
