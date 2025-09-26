//
//  HealthcareProfileView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 26.09.2025.
//
import SwiftUI

struct HealthcareProfileView: View {
    
    var fullName: String = "Noah Turner"
    var placeName: String = "New Yourk, NY"
    var placeTitle: String = "Location"
    var statusTitle: String = "Good morning!"
    
    var avatarName: String

    var body: some View {
        HStack(spacing: 0) {
            Image(avatarName)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .background(Color.green)
                .clipShape(Circle())
                .padding(.leading, 16)
                .padding(.trailing, 14)

            VStack(spacing: 8) {
                HStack(alignment: .lastTextBaseline) {
                    Text(statusTitle)
                        .font(.satoshi(size: 14))
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(placeTitle)
                        .font(.satoshi(size: 14))
                        .foregroundStyle(.gray)
                }
                HStack(alignment: .lastTextBaseline) {
                    Text(fullName)
                        .font(.satoshi(size: 20))
                        .foregroundStyle(.black)
                    Spacer()
                    Text(placeName)
                        .font(.satoshi(size: 16))
                        .foregroundStyle(.black)
                }
            }
            .padding(.trailing, 16)
        }
    }
}
