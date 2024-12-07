//
//  CountryListViewModel.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import Foundation

@MainActor class CountryListViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func fetchCountries() {
        isLoading = true
        Task {
            do {
                countries = try await NetworkService.shared.fetchCountriesFromApi()
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
