//
//  DataStore.swift
//  vamphelper
//
//  Created by goktan on 1.09.2021.
//  Copyright © 2021 goktan. All rights reserved.
//
import Foundation

class DataStore {
    
    // MARK: - Properties
    let defaults = UserDefaults.standard
    
    var currentDay: Int {
        let now = Date()
        let day = Calendar.current.component(.day, from: now)
        
        return day
    }
    
    // MARK: - Life Cycle
    init() {
        let latestUpdateDay = getLatestUpdateDay()

        if latestUpdateDay != currentDay {
            defaults.set(0, forKey: "currentAmount")
        }
    }
    
    // MARK: - Functions
    func getCurrentAmount() -> Double {
        let savedAmount = defaults.double(forKey: "currentAmount")
        return savedAmount
    }
    
    func getLatestUpdateDay() -> Int {
        let latestUpdateDay = defaults.integer(forKey: "latestUpdateDay")
        return latestUpdateDay
    }
    
    func addblood(amount: Double) {
        let currentAmount = getCurrentAmount()
        let newAmount = currentAmount + amount
        
        defaults.set(newAmount, forKey: "currentAmount")
        defaults.set(currentDay, forKey: "latestUpdateDay")
    }
}
