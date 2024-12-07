//
//  Country+Extensions.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 08.12.2024.
//

import Foundation

extension Country {
    init(from favoriteCountry: FavoriteCountry) {
        //self.id = favoriteCountry.id ?? UUID()
        self.name = favoriteCountry.name ?? "Unknown"
        self.officialName = favoriteCountry.officialName ?? "Unknown"
        self.capital = favoriteCountry.capital ?? "Unknown"
        self.region = favoriteCountry.region ?? "Unknown"
        self.population = Int(favoriteCountry.population)
        self.area = favoriteCountry.area
        self.currencies = (try? JSONDecoder().decode([Currency].self, from: favoriteCountry.currencies ?? Data())) ?? []
        self.languages = (try? JSONDecoder().decode([String].self, from: favoriteCountry.languages ?? Data())) ?? []
        self.timezones = (try? JSONDecoder().decode([String].self, from: favoriteCountry.timezones ?? Data())) ?? []
        self.latlng = (try? JSONDecoder().decode([Double].self, from: favoriteCountry.latlng ?? Data())) ?? []
        self.translations = (try? JSONDecoder().decode([String: Translation].self, from: favoriteCountry.translations ?? Data())) ?? [:]
        self.flagURLString = favoriteCountry.flagURLString ?? ""
    }
}
