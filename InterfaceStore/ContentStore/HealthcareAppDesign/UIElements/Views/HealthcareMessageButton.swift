//
//  HealthcareMessageButton.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 28.09.2025.
//

import SwiftUI

struct HealthcareMessageButton: View {
    
    var background: Color = .white.opacity(0.2)
    var foreground: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .padding(14)
                .frame(width: 50, height: 50)
                .background(background)
                .foregroundStyle(foreground)
                .clipShape(Circle())
        }
    }
}
