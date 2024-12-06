//
//  CountryViewRow.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import SwiftUI

struct CountryViewRow: View {
    
    var country: Country
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: country.flagURLString)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 15))
            } placeholder: {
                Image("flag_placeholder")
            }

            
            Text(country.name)
                .font(.headline)
            Text(country.region)
                .font(.caption)
        }
        //Spacer()
        //.padding(.leading)
    }
}

#Preview {
    let country = Country(id: UUID(), name: "Russia", officialName: "Россия", capital: "Москва", region: "Europe", population: 0, area: 12, currencies: [Currency(name: "rub", symbol: "ru")], languages: [""], timezones: [""], latlng: [], flagURLString: "https://flagcdn.com/w320/de.png")
    
    CountryViewRow(country: country)
}
