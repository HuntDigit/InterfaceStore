//
//  CustomTabBarViewScreen.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarViewScreen: View {
    
    @State private var selection: TabBarItem = .init(image: "house", title: "Home", color: .blue)
    
    var body: some View {
        CustomTabBarContainerView(selection: $selection) {
            Color.blue
                .tabBarItem(.init(image: "house", title: "Home", color: .blue), selection: $selection)
            
            Color.orange
                .tabBarItem(.init(image: "star", title: "Favorite", color: .orange), selection: $selection)
            
            Color.green
                .tabBarItem(.init(image: "person", title: "Profile", color: .green), selection: $selection)
        }
    }
}

#Preview {
    CustomTabBarViewScreen()
}
