//
//  SetModel.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 03/02/23.
//

import Foundation

// infos Brickset API
/*
 
 {
     "setID": 7522,
     "number": "0012",
     "numberVariant": 1,
     "name": "Space minifigures",
     "year": 1979,
     "theme": "Space",
     "themeGroup": "Action/Adventure",
     "subtheme": "Minifigure Pack",
     "category": "Normal",
     "released": true,
     "pieces": 4,
     "minifigs": 2,
     "image": {
       "thumbnailURL": "https://images.brickset.com/sets/small/0012-1.jpg",
       "imageURL": "https://images.brickset.com/sets/images/0012-1.jpg"
     },
     "bricksetURL": "https://brickset.com/sets/0012-1",
     "collection": {},
     "collections": {
       "ownedBy": 117,
       "wantedBy": 400
     },
     "LEGOCom": {
       "US": {},
       "UK": {},
       "CA": {},
       "DE": {}
     },
     "rating": 0.0,
     "reviewCount": 1,
     "packagingType": "{Not specified}",
     "availability": "{Not specified}",
     "instructionsCount": 0,
     "additionalImageCount": 0,
     "ageRange": {},
     "dimensions": {},
     "barcode": {},
     "extendedData": {},
     "lastUpdated": "2021-04-18T10:55:38.15Z"
   }
 
 */

// MARK: - Meu modelo
/*
 
struct SetModel: Identifiable, Codable {
    let id: Int
    let number, numberVariant: Int
    let name: String
    let year: Int
    let theme, themeGroup, subtheme, category: String
    let released: Bool
    let pieces, minifigs: Int
    let image: image
    let bricksetURL: String
    // let collection
    let collections: collections
    let LEGOCom: [countryPrice]
    let rating: Double
    let reviewCount: Int
    let packagingType, availability: String
    let instructionsCount, additionalImageCount: Int
    let ageRange: ageRange
    let dimensions: dimensions
    
}

struct image {
    let thumbnailURL, imageURL: String
}

struct collections {
    let ownedBy, wantedBy: Int
}

struct countryPrice {
    let retailPrice: Double
    let dateFirstAvailable: String
}

struct ageRange {
    let min, max: Int?
}

struct dimensions {
    let height, width, depth: Double?
}

struct barcode {
    
}

*/

// MARK: - Modelo do site
struct WelcomeElement: Identifiable, Codable {
    let id: Int
    let number: String
    let numberVariant: Int
    let name: String
    let year: Int
    let theme: Theme
    let themeGroup: ThemeGroup
    let subtheme: String
    let category: Category
    let released: Bool
    let pieces: Int
    let image: Image
    let bricksetUrl: String
    let collection: Collection
    let collections: Collections
    let legoCom: LEGOCom
    let rating: Double
    let reviewCount: Int
    let packagingType: PackagingType
    let availability: Availability
    let instructionsCount, additionalImageCount: Int
    let ageRange: AgeRange
    let dimensions: Dimensions
    let barcode: Barcode
    let extendedData: Collection
    let lastUpdated: String
    let minifigs: Int?

    enum CodingKeys: String, CodingKey {
        case id = "setID"
        case number, numberVariant, name, year, theme, themeGroup, subtheme, category, released, pieces, image
        case bricksetUrl = "bricksetURL"
        case collection, collections
        case legoCom = "LEGOCom"
        case rating, reviewCount, packagingType, availability, instructionsCount, additionalImageCount, ageRange, dimensions, barcode, extendedData, lastUpdated, minifigs
    }
}

// MARK: - AgeRange
struct AgeRange: Codable {
    let min, max: Int?
}

enum Availability: String, Codable {
    case legoExclusive = "LEGO exclusive"
    case notSpecified = "{Not specified}"
    case promotional = "Promotional"
    case retail = "Retail"
}

// MARK: - Barcode
struct Barcode: Codable {
    let ean, upc: String?

    enum CodingKeys: String, CodingKey {
        case ean = "EAN"
        case upc = "UPC"
    }
}

enum Category: String, Codable {
    case normal = "Normal"
}

// MARK: - Collection
struct Collection: Codable {
}

// MARK: - Collections
struct Collections: Codable {
    let ownedBy: Int?
    let wantedBy: Int
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let height, width, depth, weight: Double?
}

// MARK: - Image
struct Image: Codable {
    let thumbnailUrl, imageUrl: String

    enum CodingKeys: String, CodingKey {
        case thumbnailUrl = "thumbnailURL"
        case imageUrl = "imageURL"
    }
}

// MARK: - LEGOCom
struct LEGOCom: Codable {
    let us, uk, ca: CA
    let de: Collection

    enum CodingKeys: String, CodingKey {
        case us = "US"
        case uk = "UK"
        case ca = "CA"
        case de = "DE"
    }
}

// MARK: - CA
struct CA: Codable {
    let retailPrice: Double?
    let dateFirstAvailable, dateLastAvailable: Date?
}

enum PackagingType: String, Codable {
    case blisterPack = "Blister pack"
    case box = "Box"
    case notSpecified = "{Not specified}"
    case polybag = "Polybag"
}

enum Theme: String, Codable {
    case starWars = "Star Wars"
}

enum ThemeGroup: String, Codable {
    case licensed = "Licensed"
}

typealias Welcome = [WelcomeElement]
