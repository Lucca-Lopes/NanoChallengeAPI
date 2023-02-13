//
//  SetModel.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 03/02/23.
//

import Foundation

// MARK: - Classes da API
/*
 
 Class sets
     Public setID As Integer
     Public number As String
     Public numberVariant As Integer
     Public name As String
     Public year As Integer
     Public theme As String
     Public themeGroup As String
     Public subtheme As String
     Public category As String
     Public released As Boolean
     Public pieces As Integer?
     Public minifigs As Integer?
     Public image As New image
     Public bricksetURL As String
     Public collection As New collection
     Public collections As New collections
     Public LEGOCom As New LEGOCom
     Public rating As Single
     Public reviewCount As integer
     Public packagingType As String
     Public availability As String
     Public instructionsCount As Integer
     Public additionalImageCount As Integer
     Public ageRange As New ageRange
     Public dimensions As New dimensions
     Public barcode As New barcodes
     Public extendedData As New extendedData
     Public lastUpdated As DateTime
 End Class

 Class LEGOCom
     Public US As New LEGOComDetails
     Public UK As New LEGOComDetails
     Public CA As New LEGOComDetails
     Public DE As New LEGOComDetails
 End Class

 Class LEGOComDetails
     Public retailPrice As Decimal?
     Public dateFirstAvailable As DateTime?
     Public dateLastAvailable As DateTime?
 End Class

 Class dimensions
     Public height As Single?
     Public width As Single?
     Public depth As Single?
     Public weight As Single?
 End Class

 Class extendedData
     Public notes As String
     Public tags() As String
     Public description As String
 End Class

 Class collection
     Public owned As Boolean?
     Public wanted As Boolean?
     Public qtyOwned As Integer?
     Public rating As Integer?
     Public notes As String
 End Class

 Class collections
     Public ownedBy As Integer?
     Public wantedBy As Integer?
 End Class

 Class barcodes
     Public EAN As String
     Public UPC As String
 End Class

 Class ageRange
     Public min As Integer?
     Public max As Integer?
 End Class

 Class image
     Public thumbnailURL As String
     Public imageURL As String
 End Class


*/

struct SetResponse: Codable {
    let status: String
    let matches: Int
    let sets: [SetModel]
}

// MARK: - Modelo
struct SetModel: Identifiable, Codable {
    let id: Int
    let number: String
    let numberVariant: Int
    let name: String
    let year: Int
    let theme: String
    let themeGroup: String
    let subtheme: String?
    let category: String
    let released: Bool
    let pieces: Int?
    let minifigs: Int?
    let image: SetImage
    let bricksetUrl: String
    let collection: Collection
    let collections: Collections
    let legoCom: LEGOCom
    let rating: Double
    let reviewCount: Int
    let packagingType: String
    let availability: String
    let instructionsCount, additionalImageCount: Int
    let ageRange: AgeRange
    let dimensions: SetDimensions
    let barcode: Barcode
    let extendedData: ExtendedData?
    let lastUpdated: String

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

//enum Availability: String, Codable {
//    case legoExclusive = "LEGO exclusive"
//    case notSpecified = "{Not specified}"
//    case promotional = "Promotional"
//    case retail = "Retail"
//}

// MARK: - Barcode
struct Barcode: Codable {
    let ean, upc: String?

    enum CodingKeys: String, CodingKey {
        case ean = "EAN"
        case upc = "UPC"
    }
}

//enum Category: String, Codable {
//    case normal = "Normal"
//}

// MARK: - Collection
struct Collection: Codable {
    let owned: Bool?
    let wanted: Bool?
    let qtyOwned: Int?
    let rating: Int?
    let notes: String?
}

// MARK: - Collections
struct Collections: Codable {
    let ownedBy: Int?
    let wantedBy: Int
}

// MARK: - Dimensions
struct SetDimensions: Codable {
    let height, width, depth, weight: Double?
}

// MARK: - Image
struct SetImage: Codable {
    let thumbnailUrl, imageUrl: String

    enum CodingKeys: String, CodingKey {
        case thumbnailUrl = "thumbnailURL"
        case imageUrl = "imageURL"
    }
}

// MARK: - LEGOCom
struct LEGOCom: Codable {
    let us, uk, ca, de: LegoComDetails

    enum CodingKeys: String, CodingKey {
        case us = "US"
        case uk = "UK"
        case ca = "CA"
        case de = "DE"
    }
}

// MARK: - CA
struct LegoComDetails: Codable {
    let retailPrice: Double?
    let dateFirstAvailable, dateLastAvailable: String?
}

struct ExtendedData: Codable {
    let notes: String?
    let tags: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case notes
        case tags = "tags()"
        case description
    }
}

//enum PackagingType: String, Codable {
//    case blisterPack = "Blister pack"
//    case box = "Box"
//    case notSpecified = "{Not specified}"
//    case polybag = "Polybag"
//}

//enum Theme: String, Codable {
//    case starWars = "Star Wars"
//}
//
//enum ThemeGroup: String, Codable {
//    case licensed = "Licensed"
//}

//typealias Welcome = [SetModel]
