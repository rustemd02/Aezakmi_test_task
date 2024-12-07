//
//  FavoritesViewModel.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 07.12.2024.
//

import Foundation
import CoreData

@MainActor
class FavoritesViewModel: ObservableObject {
    @Published var favoriteCountries: [FavoriteCountry] = []
    
    func fetchFavoriteCountries() {
        let request: NSFetchRequest<FavoriteCountry> = FavoriteCountry.fetchRequest()
        do {
            favoriteCountries = try CoreDataService.shared.context.fetch(request)
        } catch {
            print("Error fetching favorite countries: \(error)")
        }
    }
    
    func deleteFavoriteCountry(at offsets: IndexSet) {
        offsets.forEach { index in
            let countryToDelete = favoriteCountries[index]
            CoreDataService.shared.context.delete(countryToDelete)
        }
        CoreDataService.shared.saveContext()
        fetchFavoriteCountries()
    }
}
