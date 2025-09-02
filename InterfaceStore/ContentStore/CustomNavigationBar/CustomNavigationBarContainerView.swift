//
//  CustomNavigationBarContainerView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.09.2025.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    @State var title: String
    var isBackButtonHidden: Bool
    
    var content: Content

    init(_ title: String? = nil, _ isBackButtonHidden: Bool = false, @ViewBuilder content: () -> Content) {
        self.title = title ?? ""
        self.isBackButtonHidden = isBackButtonHidden
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                content
                    .ignoresSafeArea(.all)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top){
                CustomNavigationBarView(title: title)
            }
            .onPreferenceChange(NavigationBarTitlePreferenceKey.self) { value in
                title = value
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}
