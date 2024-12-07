//
//  NetworkService.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import UIKit

enum NetworkError: Error {
    case badRequest
    case badURL
    case invalidData
}

struct NetworkService {
    static let shared = NetworkService()
    private let cache = NSCache<NSString, UIImage>()
    private let apiUrl = "\(Bundle.main.object(forInfoDictionaryKey: "BASE_URL") ?? "")\(Bundle.main.object(forInfoDictionaryKey: "ALL_COUNTRIES_ENDPOINT_URL") ?? "")"
    
    
    func fetchCountriesFromApi() async throws -> [Country] {
        guard let url = URL(string: apiUrl) else { throw NetworkError.badURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponce = try decoder.decode([Country].self, from: data)
            
            return decodedResponce
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    // если картинка есть в кэше - берем оттуда, иначе скачиваем с сети
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = urlString
        
        if let image = cache.object(forKey: NSString(string: cacheKey)) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else { return completion(nil) }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return completion(nil) }
            
            self.cache.setObject(image, forKey: NSString(string: cacheKey))
            completion(image)
        }
        task.resume() 
    }
}
