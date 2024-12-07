//
//  CountryDetailView.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 06.12.2024.
//

import SwiftUI
import MapKit

struct CountryDetailView: View {
    
    // MARK: Properties
    var country: Country
    @StateObject var viewModel = CountryDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                // MARK: Top segment
                FlagImage(urlString: country.flagURLString)
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 15))
                    .frame(width: 300, height: 150)
                .padding()
                
                Label(title: {
                    Text(country.name)
                        .font(.title)
                        .fontWeight(.bold)
                }, icon: {
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "translate")
                        
                    }
                    .buttonStyle(.bordered)
                    
                })
                Text(country.capital)
                    .font(.caption)
                    .fontWeight(.medium)
                
            }
            .onAppear {
                viewModel.formatValues(for: country)
                viewModel.setCountryURL(with: country.name)
            }
            
            // MARK: Country info
            Grid {
                GridRow { SmallInfoView(label: "Capital", value: country.capital) }
                GridRow { SmallInfoView(label: "Population", value: String(country.population)) }
                GridRow { SmallInfoView(label: "Area", value: String(country.area)) }
                GridRow { SmallInfoView(label: "Currency", value: viewModel.currenciesFormatted) }
                GridRow { SmallInfoView(label: "Languages", value: viewModel.languagesFormatted) }
                GridRow { SmallInfoView(label: "Timezones", value: viewModel.timezonesFormatted) }
            }
            .padding(.top)
            
            MapView(lattitude: country.latlng[0], longitude: country.latlng[1])
             .padding()
            
            // MARK: Buttons
            Group {
                Button {
                    viewModel.addCountryToFavorites(country)
                    print("Added")
                } label: {
                    Label(title: {
                        Text(NSLocalizedString("Add to favorites", comment: ""))
                    }, icon: {
                        Image(systemName: "star")
                    })
                }
                
                if let url = URL(string: viewModel.countryURL) {
                    ShareLink(item: url) {
                        Label(title: {
                            Text(NSLocalizedString("Share", comment: ""))
                        }, icon: {
                            Image(systemName: "square.and.arrow.up")
                        })
                    }
                }

            }
            .buttonStyle(.bordered)

        }

        
    }
}

// MARK: Refactored helper struct
struct SmallInfoView: View {
    let label: String
    let value: String
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.8)
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
            
            VStack {
                Text(NSLocalizedString(label, comment: ""))
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .frame(width: 300, height: 70)
        .padding(8)
    }
}

// MARK: Refactored helper struct
struct MapView: View {
    let lattitude: Double
    let longitude: Double

    var body: some View {
        Map {
            Marker("", coordinate: CLLocationCoordinate2D(latitude: lattitude, longitude: longitude))
        }
        .frame(width: 300, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}


#Preview {
//    let country = Country(name: "Russia", officialName: "Россия", capital: "Москва", region: "Europe", population: 0, area: 12, currencies: [Currency(name: "rub", symbol: "ru")], languages: [""], timezones: [""], latlng: [52.52, 13.4], flagURLString: "https://flagcdn.com/w320/de.png")
//    
//    CountryDetailView(country: country)
}
