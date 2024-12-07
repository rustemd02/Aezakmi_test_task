//
//  CountryListView.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import SwiftUI
import CoreData

struct CountryListView: View {
    
    @StateObject var viewModel = CountryListViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredCountries) { country in
                    NavigationLink(value: country) {
                        CountryViewRow(country: country)
                    }
                }
            }
            .task {
                viewModel.fetchCountries()
            }

            .onChange(of: searchQuery, { _, newValue in
                viewModel.filterCountries(by: newValue)
            })
            .navigationDestination(for: Country.self) { country in
                CountryDetailView(country: country)
            }
        }
        .navigationTitle("Countries")
        .searchable(text: $searchQuery, placement: .automatic, prompt: NSLocalizedString("Search", comment: ""))
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
        if viewModel.isLoading {
            ProgressView()
        }
        
    }
}

#Preview {
    CountryListView()
}
