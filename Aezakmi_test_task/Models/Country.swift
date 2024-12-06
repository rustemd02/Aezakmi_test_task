//
//  Country.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import Foundation

struct Country: Hashable, Codable, Identifiable {
    let id: UUID
    let name: String
    let officialName: String
    let capital: String
    let region: String
    let population: Int
    let area: Int
    let currencies: [Currency]
    let languages: [String]
    let timezones: [String]
    let latlng: [Double]
    let flagURLString: String
    
    enum CodingKeys: String, CodingKey {
            case id
            case name = "name.common"
            case officialName = "name.official"
            case capital = "capital"
            case region
            case population
            case area
            case currencies
            case languages
            case timezones
            case latlng = "capitalInfo.latlng"
            case flagURLString = "flags.png"
        }
}

struct Translation: Hashable, Codable {
    let official: String
    let common: String
}
