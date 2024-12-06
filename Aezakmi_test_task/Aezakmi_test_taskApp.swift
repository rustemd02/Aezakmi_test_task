//
//  Aezakmi_test_taskApp.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 05.12.2024.
//

import SwiftUI

@main
struct Aezakmi_test_taskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CountryTabBarView()
               // .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
