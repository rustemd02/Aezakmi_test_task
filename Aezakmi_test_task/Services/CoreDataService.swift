//
//  CoreDataService.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 07.12.2024.
//

import CoreData
import UIKit

class CoreDataService: ObservableObject {
    static let shared = CoreDataService()
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Aezakmi_test_task")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
            persistentContainer.viewContext
        }
    
    func addCountryToFavorites(_ country: Country) {
        guard !checkForDuplicates(country.id) else { return }
        
        let favoriteCountry = FavoriteCountry(context: context)
        
        favoriteCountry.id = country.id
        favoriteCountry.name = country.name
        favoriteCountry.officialName = country.officialName
        favoriteCountry.capital = country.capital
        favoriteCountry.region = country.region
        favoriteCountry.population = Int64(country.population)
        favoriteCountry.area = country.area
        favoriteCountry.currencies = try? JSONEncoder().encode(country.currencies)
        favoriteCountry.languages = try? JSONEncoder().encode(country.languages)
        favoriteCountry.timezones = try? JSONEncoder().encode(country.timezones)
        favoriteCountry.latlng = try? JSONEncoder().encode(country.latlng)
        favoriteCountry.flagURLString = country.flagURLString
        NetworkService.shared.downloadImage(from: country.flagURLString) { image in // изображение уже закэшировано там, мы не качаем его 2 раза
            favoriteCountry.flagURLString = self.saveImageToDisk(image: image, withName: country.name)
        }
        
        saveContext()
    }
    
    func checkForDuplicates(_ id: UUID) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteCountry> = FavoriteCountry.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        fetchRequest.fetchLimit = 1
        
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            return false
        }
    }
    
    func saveImageToDisk(image: UIImage?, withName name: String) -> String? {
        guard let data = image?.pngData() else { return nil }
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let filePath = directory?.appendingPathComponent("\(name).png")
        
        do {
            if let filePath = filePath {
                try data.write(to: filePath)
                return filePath.path
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
