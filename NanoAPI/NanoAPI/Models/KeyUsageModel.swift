//
//  GetKeyUsageModel.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 14/02/23.
//

import Foundation

struct KeyUsageModel: Codable, Hashable {
    let dateStamp: String
    let count: Int
}

struct KeyUsageResponse: Codable {
    let status: String
    let matches: Int
    let apiKeyUsage: [KeyUsageModel]
}
