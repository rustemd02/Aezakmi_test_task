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
                    Image(systemName: "flag")
                    Text(NSLocalizedString("Countries", comment: ""))
                }
            FavoritesList()
                .tabItem {
                    Image(systemName: "star")
                    Text(NSLocalizedString("Favorites", comment: ""))
                }
        }
    }
}

#Preview {
    CountryTabBarView()
}
