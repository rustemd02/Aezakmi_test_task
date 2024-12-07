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
    
    @Published var countryURL = ""
    
    
    func formatValues(for country: Country) {
        currenciesFormatted = country.currencies
                                .map { "\($0.name) (\($0.symbol))" }
                                .joined(separator: ", ")
        languagesFormatted = country.languages
                                .joined(separator: ", ")
        timezonesFormatted = country.timezones
                                .joined(separator: ", ")
    }
    
    func setCountryURL(with name: String) {
        countryURL = "\(Bundle.main.object(forInfoDictionaryKey: "BASE_URL") ?? "")\(Bundle.main.object(forInfoDictionaryKey: "COUNTRY_ENDPOINT_URL") ?? "")\(name)"
    }

}
