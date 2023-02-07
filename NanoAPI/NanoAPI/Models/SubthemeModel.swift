//
//  Subtheme Model.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 03/02/23.
//

import Foundation

// infos Brickset API
/*
 
 "theme": "Space",
 "subtheme": "Alien Conquest",
 "setCount": 10,
 "yearFrom": 2011,
 "yearTo": 2011
 
 */

struct SubthemeModel: Codable, Hashable {
    let theme, subtheme: String
    let setCount, yearFrom, yearTo: Int
}
