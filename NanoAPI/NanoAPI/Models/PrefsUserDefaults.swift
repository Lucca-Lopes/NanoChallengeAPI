//
//  UserDefaults.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 14/02/23.
//

import Foundation

class PrefsUserDefaults {
    let userDefaults = UserDefaults.standard
    var numUsosDaKey: Int = 0
    var ultimaDataDeUso: Date = Date()
    var numApiKey = 1
    
    init(){
        carregarData()
        carregarNumUsos()
    }
    
    func verificarUso(){
        if isSameDay(date1: ultimaDataDeUso, date2: Date()) {
            if numUsosDaKey % 125 != 0 {
                numUsosDaKey+=1
            }
            else if numUsosDaKey < 625{
                numApiKey+=1
                numUsosDaKey+=1
            }
        }
    }
    
    func carregarData(){
        if let load = userDefaults.value(forKey: "data") as? Date{
            ultimaDataDeUso = load
        }
        else {
            ultimaDataDeUso = Date()
        }
    }
    
    func carregarNumUsos(){
        if let load = userDefaults.value(forKey: "usos") as? Int{
            numUsosDaKey = load
        }
        else {
            numUsosDaKey = 0
        }
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.day], from: date1, to: date2)
        if diff.day == 0 {
            return true
        } else {
            return false
        }
    }
}
