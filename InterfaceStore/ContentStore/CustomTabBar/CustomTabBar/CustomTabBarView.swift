//
//  CustomTabBarView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarView: View {
    
    private let geomertyID: String = "background_rectangle"
    
    var tabs: [TabBarItem] = []
    @State var pSelection: TabBarItem
    @Binding var selection: TabBarItem
    @Namespace var localNamespace
    
    var  body: some View {
        tabBarViewAnimated()
            .onChange(of: selection) { _ , newValue in
                withAnimation {
                    pSelection = newValue
                }
            }
    }
}

// MARK: - Static -

extension CustomTabBarView {
    private func staticTabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName:tab.image)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            Text(tab.title)
        }
        .foregroundStyle(pSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(pSelection == tab ? tab.color.opacity(0.2) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            switchTabBarItem(tab)
        }
    }
    
    func staticTabBarView() -> some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                staticTabView(tab: tab)
            }
        }
        .padding()
        .background(Material.ultraThickMaterial)
    }
    
    func switchTabBarItem(_ tabBarItem: TabBarItem) {
        selection = tabBarItem
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
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background {
            ZStack {
                if pSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: geomertyID,
                                               in: localNamespace)
                }
            }
        }
        .onTapGesture {
            switchTabBarItem(tab)
        }
    }
    
    func tabBarViewAnimated() -> some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabViewAnimated(tab: tab)
            }
        }
        .padding()
        .background(Material.ultraThickMaterial)
    }
}


#Preview {
    CustomTabBarView(tabs: [.home, .favorites, .settings], pSelection: .home,
                     selection: .constant(.home))
}
