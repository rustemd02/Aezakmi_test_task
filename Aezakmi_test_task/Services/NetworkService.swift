//
//  NetworkService.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import Foundation

enum NetworkErrors: Error {
    case badRequest
    case badURL
}

struct NetworkService {
    static let shared = NetworkService()
    
    
    
    func fetchCountriesFromApi() async throws {
        
    }
}
