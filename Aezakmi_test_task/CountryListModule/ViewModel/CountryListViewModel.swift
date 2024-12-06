//
//  CountryListViewModel.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import Foundation

class CountryListViewModel: ObservableObject {
    @Published var countries: [Country] = []
    
    func fetchCountries() {
        
    }
    
}
