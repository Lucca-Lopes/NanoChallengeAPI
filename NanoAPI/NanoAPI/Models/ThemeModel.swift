//
//  ThemeModel.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 03/02/23.
//

import Foundation

// infos Brickset API
/*
 
 "theme": "4 Juniors",
 "setCount": 24,
 "subthemeCount": 5,
 "yearFrom": 2003,
 "yearTo": 2004
 
 */

struct ThemeModel: Identifiable, Codable {
    let theme: String
    let setCount, subthemeCount, yearFrom, yearTo: Int
    var id = UUID()
}
