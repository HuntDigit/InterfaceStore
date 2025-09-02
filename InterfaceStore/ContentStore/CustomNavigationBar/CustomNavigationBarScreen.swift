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
        CustomNavigationBarContainerView() {
            Text("Content")
                .customNavigationBarTitle("Tex2aawdwda332")

        }
    }
}

#Preview {
    CustomNavigationBarScreen()
}
