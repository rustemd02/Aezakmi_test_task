//
//  Country.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import Foundation

struct Country: Hashable, Codable, Identifiable {
    let id = UUID()
    let name: String
    let officialName: String
    let capital: String
    let region: String
    let population: Int
    let area: Double
    let currencies: [Currency]
    let languages: [String]
    let timezones: [String]
    let latlng: [Double]
    let translations: [String: Translation]
    let flagURLString: String

    enum CodingKeys: String, CodingKey {
        case name
        case officialName = "official"
        case capital
        case region
        case population
        case area
        case currencies
        case languages
        case timezones
        case latlng
        case translations
        case flagURLString = "flags"
    }
    
    enum NameKeys: String, CodingKey {
        case common
        case official
    }
    
    enum FlagsKeys: String, CodingKey {
        case png
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .common)
        officialName = try nameContainer.decode(String.self, forKey: .official)
        capital = (try container.decodeIfPresent([String].self, forKey: .capital)?.first) ?? "Unknown"
        region = try container.decode(String.self, forKey: .region)
        population = try container.decode(Int.self, forKey: .population)
        area = try container.decode(Double.self, forKey: .area)
        timezones = try container.decode([String].self, forKey: .timezones)
        latlng = try container.decode([Double].self, forKey: .latlng)
        
        let flagsContainer = try container.nestedContainer(keyedBy: FlagsKeys.self, forKey: .flagURLString)
        flagURLString = try flagsContainer.decode(String.self, forKey: .png)
        
        let currenciesDict = try container.decode([String: Currency].self, forKey: .currencies)
        currencies = Array(currenciesDict.values)
        
        let languagesDict = try container.decode([String: String].self, forKey: .languages)
        languages = Array(languagesDict.values)
        
        translations = try container.decodeIfPresent([String: Translation].self, forKey: .translations) ?? [:]
    }
}
