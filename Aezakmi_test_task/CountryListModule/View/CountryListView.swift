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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.countries) { country in
                    NavigationLink(value: country) {
                        CountryViewRow(country: country)
                    }
                }
            }
            .task {
                viewModel.fetchCountries()
            }
            .navigationDestination(for: Country.self) { country in
                CountryDetailView(country: country)
            }
        }
        .navigationTitle("Countries")

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
