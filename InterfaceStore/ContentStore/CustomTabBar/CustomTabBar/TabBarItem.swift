//
//  TabBarItem.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 30.08.2025.
//

import SwiftUI

enum TabBarItem: Hashable {
    case home
    case favorites
    case settings
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "star"
        case .settings:
            return "gear"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .settings:
            return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .blue
        case .favorites:
            return .orange
        case .settings:
            return .green
        }
    }
}
