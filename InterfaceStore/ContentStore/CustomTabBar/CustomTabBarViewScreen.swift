//
//  CustomTabBarViewScreen.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarViewScreen: View {
    
    @State private var selection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $selection) {
            Color.blue
                .tabBarItem(.home, selection: $selection)
            
            Color.orange
                .tabBarItem(.favorites, selection: $selection)
            
            Color.green
                .tabBarItem(.settings, selection: $selection)
        }
    }
}

#Preview {
    CustomTabBarViewScreen()
}
