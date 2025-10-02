//
//  HealthcareGroupHeaderView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.10.2025.
//

import SwiftUI

struct HealthcareGroupHeaderView: View {
    
    var text: String
    var buttonText: String?
    var action: () -> ()
    
    var body: some View {
        HStack {
            Text(text)
                .font(.satoshi(size: 22))
                .foregroundStyle(.black)
            
            Spacer()
            if let labelText = buttonText {
                Button {
                    action()
                } label: {
                    Text(labelText)
                        .font(.satoshi(size: 16))
                        .foregroundStyle(.gray)
                }
            }
        }
        .frame(minHeight: 44)
        .padding(.horizontal, 16)
    }
}
