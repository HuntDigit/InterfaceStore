//
//  NavigationBarUtils.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.09.2025.
//

import SwiftUI

struct NavigationBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        print("Next Value: \(nextValue())")
        value += nextValue()
        print("Seted value:\(value)")
    }
}

//struct NavigationBarViewModifier: ViewModifier {
//    var title: String
//    
//    func body(content: Content) -> some View {
//        content
//            .preference(key: NavigationBarTitlePreferenceKey.self, value: title )
//    }
//}

extension View {
    func customNavigationBarTitle(_ title: String) -> some View {
        preference(key: NavigationBarTitlePreferenceKey.self, value: title )
    }
}
