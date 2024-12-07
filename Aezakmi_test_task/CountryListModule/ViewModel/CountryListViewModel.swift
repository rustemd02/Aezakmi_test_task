//
//  CountryListViewModel.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import Foundation

@MainActor class CountryListViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var countries: [Country] = []
    @Published var filteredCountries: [Country] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var searchQuery: String = ""
    
    func filterCountries(by query: String) {
        if query.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter {
                $0.name.localizedCaseInsensitiveContains(query)
            }
        }
    }
    
    func fetchCountries() {
        isLoading = true
        Task {
            do {
                countries = try await NetworkService.shared.fetchCountriesFromApi()
                filteredCountries = countries
                isLoading = false
            } catch {
                if let error = error as? NetworkError {
                    switch error {
                    case .badRequest:
                        alertItem = AlertInfo.badRequest
                    case .badURL:
                        alertItem = AlertInfo.badURL
                    case .invalidData:
                        alertItem = AlertInfo.invalidData
                    }
                }
            }
            isLoading = false
        }
    }
    
}


