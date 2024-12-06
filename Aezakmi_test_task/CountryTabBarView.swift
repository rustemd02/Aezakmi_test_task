//
//  CountryTabView.swift
//  Aezakmi_test_task
//
//  Created by Рустем on 06.12.2024.
//

import SwiftUI

struct CountryTabBarView: View {
    var body: some View {
        TabView {
            Tab("Countries", systemImage: "flag") {
                CountryListView()
            }
            Tab("Favorites", systemImage: "star") {
                //
            }
            .badge(5)
        }
    }
}

#Preview {
    CountryTabBarView()
}
