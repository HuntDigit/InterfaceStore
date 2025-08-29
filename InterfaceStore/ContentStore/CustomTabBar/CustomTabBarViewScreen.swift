//
//  CustomTabBarViewScreen.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarViewScreen: View {
    
    @State private var selection: String = "star"
    
    var body: some View {
        Text(selection)
        TabView(selection: $selection) {
            Color.blue
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag("home")
            
            Color.red
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
                .tag("star")
            
            Color.green
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag("gear")

        }
    }
}

#Preview {
    CustomTabBarViewScreen()
}
