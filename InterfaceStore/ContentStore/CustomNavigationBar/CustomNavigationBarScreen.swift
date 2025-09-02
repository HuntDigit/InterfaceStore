//
//  CustomNavigationBarScreen.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.09.2025.
//

import SwiftUI

struct CustomNavigationBarScreen: View {
    
    @State var title: String = "Navigation Bar"
    @State var isBackButtonHidden: Bool = true

    var body: some View {
        CustomNavigationBarContainerView(title: $title,
                                         isBackButtonHidden: $isBackButtonHidden) {
            Text("Content")
                .font(.headline)
        }
        .onAppear() {
            title = "Navigation Bar New2"
            isBackButtonHidden = false
        }
    }
}

#Preview {
    CustomNavigationBarScreen()
}
