//
//  AlertItem.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 07.12.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertInfo {
    static let badRequest = AlertItem(title: Text(NSLocalizedString("Server error", comment: "")), message: Text(NSLocalizedString("bad_request_error", comment: "")), dismissButton: .default(Text("OK")))
    
    static let badURL = AlertItem(title: Text(NSLocalizedString("Server error", comment: "")), message: Text(NSLocalizedString("bad_url_error", comment: "")), dismissButton: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text(NSLocalizedString("Server error", comment: "")), message: Text(NSLocalizedString("invalid_data_error", comment: "")), dismissButton: .default(Text("OK")))
    
    static let addedSuccesfully = AlertItem(title: Text(NSLocalizedString("Success", comment: "")), message: Text(NSLocalizedString("Country added to favorites list", comment: "")), dismissButton: .default(Text("OK")))
    
    static let duplicacyError = AlertItem(title: Text(NSLocalizedString("Error", comment: "")), message: Text(NSLocalizedString("Country is already in your favorites list", comment: "")), dismissButton: .default(Text("OK")))
}

