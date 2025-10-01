//
//  HealthcareDoctorCardView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 01.10.2025.
//

import SwiftUI

struct HealthcareDoctorCardView: View {
    
    var body: some View {
        HStack(spacing: 8) {
            Image("female-doctor-avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 78, height: 78)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            VStack(alignment:  .leading) {
                Text("Dr. Deniel Raynolds")
                    .font(.satoshi(size: 16))
                    .foregroundColor(.black)
                Text("General Practitioner")
                    .font(.satoshi(size: 13))
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.yellow)
                    Text("4.7")
                        .font(.satoshi(size: 13))
                    RoundedRectangle(cornerRadius: 1)
                        .fill(Color(.gray).mix(with: .white, by: 0.5))
                        .font(.satoshi(size: 13))
                        .frame(width: 1)
                        .padding(4)
                    Text("120 reviews")
                        .font(.satoshi(size: 13))
                }
            }
            .padding(.vertical, 8)
            Spacer()
            VStack {
                HealthcareMessageButton(background: .green,
                                        foreground: .white) {
                    // Action
                }
                Spacer()
            }
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.white))
        }
        .padding(.horizontal, 12)
    }
}
