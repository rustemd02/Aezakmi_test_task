//
//  FavoritesList.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 06.12.2024.
//

import SwiftUI

struct FavoritesList: View {
    
    // MARK: Properties
    @StateObject var viewModel = FavoritesViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.favoriteCountries) { country in
                    NavigationLink(value: country) {
                        CountryViewRow(country: Country(from: country))
                    }
                }
                .onDelete(perform: viewModel.deleteFavoriteCountry)
            }
            .task {
                viewModel.fetchFavoriteCountries()
            }
            
            
            .navigationDestination(for: FavoriteCountry.self) { country in
                CountryDetailView(country: Country(from: country))
            }
            .navigationTitle("Favorites")
            
            
        }
    }
    
}

#Preview {
    FavoritesList()
}
