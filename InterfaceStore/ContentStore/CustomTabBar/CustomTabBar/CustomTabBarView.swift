//
//  CustomTabBarView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarView: View {
    
    private let geomertyID: String = "background_rectangle"
    @Namespace private var localNamespace

    var tabs: [TabBarItem] = []
    @State var pSelection: TabBarItem
    @Binding var selection: TabBarItem
    
    var body: some View {
        tabBarViewAnimated()
            .onChange(of: selection) { _ , newValue in
                withAnimation {
                    pSelection = newValue
                }
            }
    }
}

// MARK: - Animated -

extension CustomTabBarView {
    
    private func tabViewAnimated(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName:tab.image)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            Text(tab.title)
        }
        .foregroundStyle(pSelection == tab ? tab.color : .gray)
        .frame(maxWidth: .infinity)
        .padding(8)
        .background {
            highlightBackground(tab)
        }
        .onTapGesture {
            switchTabBarItem(tab)
        }
    }
    
    private func highlightBackground(_ tab: TabBarItem) -> some View {
        ZStack {
            if pSelection == tab {
                RoundedRectangle(cornerRadius: 10)
                    .fill(tab.color.opacity(0.2))
                    .matchedGeometryEffect(id: geomertyID,
                                           in: localNamespace)
            }
        }
    }
    
    private func tabBarViewAnimated() -> some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabViewAnimated(tab: tab)
            }
        }
        .padding(14)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(Material.regular)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
        }
        .padding(14)
        
    }
    
    private func switchTabBarItem(_ tabBarItem: TabBarItem) {
        selection = tabBarItem
    }
}

// MARK: - Preview -

#Preview("Custom Tab Bar View") {
    @Previewable @State var selection: TabBarItem = .home

    CustomTabBarView(tabs: [.home, .favorites, .settings],
                     pSelection: selection,
                     selection: $selection)
}
