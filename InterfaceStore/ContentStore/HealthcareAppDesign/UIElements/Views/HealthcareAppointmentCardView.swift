//
//  HealthcareAppointmentCardView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 28.09.2025.
//

import SwiftUI

struct HealthcareAppointmentCardView: View {
    
    let count: Int
    
    private let offsetStep:CGFloat = 15.0
    private let scaleEffectStep:CGFloat = 0.05
    private let blendColorStep:CGFloat = 0.4
    
    var body: some View {
        ZStack {
            ForEach((0..<count).reversed(), id: \.self) { index in
                RoundedRectangle(cornerRadius: 24,
                                 style: .circular)
                .fill(
                    LinearGradient(
                        colors: colorMixWith(index),
                        startPoint: .topLeading,
                        endPoint: .bottom)
                )
                .frame(maxWidth: .infinity)
                .scaleEffect(scaleEffectWith(index))
                .offset(y: offsetWith(index))
            }

            VStack {
                HStack {
                    Image("female-doctor-avatar-white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.leading, 16)
                        .padding(.trailing, 14)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Dr. Olivia Carter")
                            .font(.satoshi(size: 18))
                            .foregroundStyle(.white)
                        
                        Text("Nephrology")
                            .font(.satoshi(size: 14))
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    HealthcareMessageButton {
                        // ACTION
                    }
                    .padding(14)
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal, 14)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Date")
                            .font(.satoshi(size: 16))
                            .foregroundStyle(.white.opacity(0.5))

                        Text("24 Apl. Monday")
                            .font(.satoshi(size: 14))
                            .foregroundStyle(.white)
                        
                        Button("Rescedule") {
                            // Action
                        }
                        .buttonStyle(AppointmentButtonStyleFilled())
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.satoshi(size: 16))
                            .foregroundStyle(.white.opacity(0.5))
                        
                        Text("10:00 AM - 11:00 AM")
                            .font(.satoshi(size: 14))
                            .foregroundStyle(.white)
                        
                        Button("View profile") {
                            // Action
                        }
                        .buttonStyle(AppointmentButtonStyleTransparent())
                    }
                }
                .padding(.horizontal, 14)
            }
            .padding(.vertical, 16)
        }
        .padding(16)
    }
    
    func offsetWith(_ index: Int) -> CGFloat {
        let value = 0.0 - CGFloat(index) * offsetStep
//        print("offsetWith")
//        print("index: \(index) - Value: \(value) ")
        return value
    }
    
    func scaleEffectWith(_ index: Int) -> CGFloat {
        let value = 1.0 - CGFloat(index) * scaleEffectStep
//        print("scaleEffectWith")
//        print("index: \(index) - Value: \(value) ")
        return value
    }
    
    func colorMixWith(_ index: Int) -> [Color] {
        let value = CGFloat(index) * blendColorStep
        print("colorMixWith")
        print("index: \(index) - Value: \(value) ")

        return [
            Color("appointmentBackgound0").mix(with: .white, by: value),
            Color("appointmentBackgound1").mix(with: .white, by: value)
        ]
    }
}

#Preview {
    ScrollView {
        Text("CardView")
        HealthcareAppointmentCardView(count: 3)
    }
    .padding(.vertical, 60)
}
