//
//  CustomTabBarContainerView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @State var tabs: [TabBarItem] = []
    @State var pSelection: TabBarItem?
    @Binding var selection: TabBarItem
    let content: Content

    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, pSelection: selection, selection: $selection)
        }
        .onPreferenceChange(TabBarItemPreferanceKey.self) { newValue in
            self.tabs = newValue
        }
    }
}
