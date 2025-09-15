//
//  ButtonStyle.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 15.09.2025.
//

import SwiftUI

struct AppointmentButtonStyleFilled: ButtonStyle {
    
//    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.satoshi(size: 14))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(.blue)
            .background(Color.white)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct AppointmentButtonStyleTransparent: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.satoshi(size: 14))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(.white)
            .background(Color.white.opacity(0.2))
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct CategoryButtonStyle: ButtonStyle {
    
    var isSelected: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.satoshi(size: 14))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(foregroundSelectedColor)
            .background(backgroundSelectedColor)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
    private var foregroundSelectedColor: Color {
        isSelected ? Color.white : Color("categorySelectedButton")
    }
    
    private var backgroundSelectedColor: Color {
        isSelected ? Color("categorySelectedButton") : Color("categoryDeselectedButton")
    }
}
