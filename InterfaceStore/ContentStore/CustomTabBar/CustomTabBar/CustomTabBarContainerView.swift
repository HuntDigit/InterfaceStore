//
//  CustomTabBarContainerView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @State private var tabs: [TabBarItem] = []
    
    @Binding var selection: TabBarItem
    let content: Content

    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack() {
            content
                .ignoresSafeArea(edges: .all)
        }
        .overlay(alignment: .bottom) {
            CustomTabBarView(tabs: tabs,
                             pSelection: selection,
                             selection: $selection)
        }
        .onPreferenceChange(TabBarItemPreferanceKey.self) { newValue in
            tabs = newValue
        }
    }
}
