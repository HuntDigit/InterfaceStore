//
//  CustomTabBarContainerView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct TabBarItemPreferanceKey: PreferenceKey {
    
    typealias Value = [TabBarItem]
    
    static let defaultValue: Value = []
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.append(contentsOf: nextValue())
    }
}

struct TabBarItemViewModifier: ViewModifier {
    let tabItem: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tabItem ? 1.0 : 0.0)
            .preference(key: TabBarItemPreferanceKey.self, value: [tabItem] )
    }
}

extension View {
    func tabBarItem(_ tabItem: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tabItem: tabItem, selection: selection))
    }
}


struct CustomTabBarContainerView<Content: View>: View {
    
    @State var tabs: [TabBarItem] = []
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
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemPreferanceKey.self) { newValue in
            self.tabs = newValue
        }
    }
}
