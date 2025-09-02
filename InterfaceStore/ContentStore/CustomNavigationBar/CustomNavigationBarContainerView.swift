//
//  CustomNavigationBarContainerView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.09.2025.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    @Binding var title: String
    @Binding var isBackButtonHidden: Bool
    
    var content: Content

    init(title:Binding<String>, isBackButtonHidden:Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._title = title
        self._isBackButtonHidden = isBackButtonHidden
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .top){
            CustomNavigationBarView(title: title,
                                    isBackButtonHidden: isBackButtonHidden)
        }
    }
}
