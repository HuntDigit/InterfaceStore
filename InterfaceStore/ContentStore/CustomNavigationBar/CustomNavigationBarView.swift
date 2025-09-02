//
//  CustomNavigationBarView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.09.2025.
//

import SwiftUI

struct CustomNavigationBarView: View {
 
    var title: String
    var subTitle: String? = nil
    var isBackButtonHidden: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            if !isBackButtonHidden {
                Button {
                    // action
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
                .padding()
            }
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.headline)
                
                if let subTitle = subTitle{
                    Text(subTitle)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            Button {
                // action
            } label: {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
            .padding()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(Color.blue.mix(with: .white, by: 0.4))
    }
}
