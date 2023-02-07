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

struct ThemeModel: Codable, Hashable {
    let theme: String
    let setCount, subthemeCount, yearFrom, yearTo: Int
}

struct ThemeResponse: Codable {
    let status: String
    let matches: Int
    let themes: [ThemeModel]
}
