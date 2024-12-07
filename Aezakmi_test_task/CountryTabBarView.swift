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
            CountryListView()
                .tabItem {
                    Text(NSLocalizedString("Countries", comment: ""))
                }
            FavoritesList()
                .tabItem {
                    Text(NSLocalizedString("Favorites", comment: ""))
                } 
        }
    }
}

#Preview {
    CountryTabBarView()
}
