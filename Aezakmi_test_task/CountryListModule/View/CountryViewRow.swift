//
//  CountryViewRow.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import SwiftUI

struct CountryViewRow: View {
    
    // MARK: Properties
    var country: Country
    
    var body: some View {
        HStack {
            // MARK: Leading part
            FlagImage(urlString: country.flagURLString)
                .scaledToFill()
                .frame(width: 125, height: 75)
                .clipShape(.rect(cornerRadius: 15))

            // MARK: Trailing part
            Text(country.name)
                .font(.headline)
            Spacer()
            Text(country.region)
                .font(.caption)
        }
    }
}

#Preview {
//    let country = Country(name: "Russia", officialName: "Россия", capital: "Москва", region: "Europe", population: 0, area: 12, currencies: [Currency(name: "rub", symbol: "ru")], languages: [""], timezones: [""], latlng: [], flagURLString: "https://flagcdn.com/w320/de.png")
//    
//    CountryViewRow(country: country)
}
