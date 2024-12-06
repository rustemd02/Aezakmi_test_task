//
//  CountryDetailViewModel.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 06.12.2024.
//

import Foundation

class CountryDetailViewModel: ObservableObject {
    
    @Published var currenciesFormatted = ""
    @Published var languagesFormatted = ""
    @Published var timezonesFormatted = ""
    
    
    func formatValues(for country: Country) {
        currenciesFormatted = country.currencies
                                .map { "\($0.name) (\($0.symbol))" }
                                .joined(separator: ", ")
        languagesFormatted = country.languages
                                .joined(separator: ", ")
        timezonesFormatted = country.timezones
                                .joined(separator: ", ")
    }

}
