//
//  CustomTabBarView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 29.08.2025.
//

import SwiftUI

struct CustomTabBarView: View {
    
    var tabs: [TabBarItem] = []
    @Binding var selection: TabBarItem
    
    var  body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
            }
        }
        .padding()
        .background(Material.ultraThickMaterial)
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName:tab.image)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            Text(tab.title)
        }
        .foregroundStyle(selection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            switchTabBarItem(tab)
        }
    }
    
    func switchTabBarItem(_ tabBarItem: TabBarItem) {
        withAnimation {
            selection = tabBarItem
        }
    }
}

struct TabBarItem : Hashable {
    let image: String
    let title: String
    let color: Color
}

#Preview {
    var tabs: [TabBarItem] = [
        .init(image: "house", title: "Home", color: .blue),
        .init(image: "star", title: "Favorite", color: .orange),
        .init(image: "person", title: "Profile", color: .green),
    ]
    CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
}
