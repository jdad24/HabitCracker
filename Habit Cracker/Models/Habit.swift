//
//  Habit.swift
//  Habit Cracker
//
//  Created by Joshua Dadson on 9/15/22.
//

import Foundation

class Habit: Codable {
    var habitName: String = ""
    var showReminder: Bool = false
    var startDate = Date()
    var daysElapsed = Int()
    var trackedDays = TrackedDays()
    var notificationIdentifier: String = ""
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { timer in
            self.calculateDaysElapsed()
            print("time")
        }
    }
    
    func encode() -> Data {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded as Data
        }
        return Data()
    }
    
    static func decode(data: Data) -> [Habit]? {
        let decoder = JSONDecoder()
        guard let decodedHabit = try? decoder.decode([Habit].self, from: data) else {return nil}
        
        return decodedHabit
        
    }
    
    func calculateDaysElapsed() {
        guard let daysElapsed = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day else {
            return 
        }
        
        self.daysElapsed = daysElapsed
    }
    
    
    static func saveHabit(_ habit: Habit) {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileName = "HabitList.txt"
        var habitList = [Habit]()
        
        do {
            let previous = try Data(contentsOf: url.appendingPathComponent(fileName))
            if let previousDecoded = Habit.decode(data: previous){
                habitList = previousDecoded
                habitList.append(habit)
            
                let encodedHabitList = habitList.encode()
                try encodedHabitList.write(to: url.appendingPathComponent(fileName))
                }
            } catch {
                habitList.append(habit)
                let encodedHabitList = habitList.encode()
                
                do {
                    try encodedHabitList.write(to: url.appendingPathComponent(fileName))
                } catch {
                    print("Write error")
                }
        }
        
    }
    
    static func updateHabit(_ habit: Habit, habitIndex: Int) {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileName = "HabitList.txt"
        var habitList = [Habit]()

        do {
            let previous = try Data(contentsOf: url.appendingPathComponent(fileName))
            if let previousDecoded = Habit.decode(data: previous){
                habitList = previousDecoded
                habitList[habitIndex] = habit
                
                let encodedHabitList = habitList.encode()
                try encodedHabitList.write(to: url.appendingPathComponent(fileName))
            }
        } catch {
            print("Error updating habit")
        }
    }
    
    static func readHabitFile() -> [Habit] {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return [] }
        let fileName = "HabitList.txt"
        
        do {
            let data = try Data(contentsOf: url.appendingPathComponent(fileName))
            
            guard let decodedHabit = Habit.decode(data: data) else {
                print("READ ERROR")
                return []
            }
            
            return decodedHabit
                  
        } catch {
            print("READ ERROR", error)
            return []
        }
        
    }
}



extension Array where Element == Habit {
    func encode() -> Data {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded as Data
        }
        return Data()
    }
}
