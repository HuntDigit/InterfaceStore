//
//  CustomNavigationBarScreen.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.09.2025.
//

import SwiftUI
import CloudKit

struct CustomNavigationBarScreen: View {
    
    @State var title: String = "Navigation Bar"
    @State var isBackButtonHidden: Bool = true
    
    var body: some View {
        CustomNavigationBarContainerView() {
            
            VStack {
                Text("Content")
                    .font(.largeTitle)
            }
            .customNavigationBarTitle("Navigation from Preferance")
        }
    }
}

#Preview {
    CustomNavigationBarScreen()
}
