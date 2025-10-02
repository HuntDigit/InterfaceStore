//
//  HealthcareCategoriesView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 02.10.2025.
//

import SwiftUI

struct HealthcareCategoriesView: View {
    
    @Binding var categories: [CategoryModel]
    @Binding var selectedCategories: [CategoryModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    Button {
                        selectedCategories.removeAll()
                    } label: {
                        Text("All")
                            .padding(.horizontal, 5)
                    }
                    .buttonStyle(CategoryButtonStyle(isSelected: selectedCategories.isEmpty))
                    .padding(.horizontal, 1)
                    
                    ForEach(categories, id: \.self) { category in
                        let isSelected = self.isSelected(category)
                        Button {
                            if !isSelected {
                                selectedCategories.append(category)
                            } else {
                                remove(category)
                            }
                        } label: {
                            Text(category.categoryType.rawValue)
                        }
                        .buttonStyle(CategoryButtonStyle(isSelected: isSelected))
                        .padding(.horizontal, 1)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    func isSelected(_ category: CategoryModel) -> Bool {
        selectedCategories.contains { $0 == category }
    }
    
    func remove(_ category: CategoryModel) {
        if let index = selectedCategories.firstIndex(of: category) {
            selectedCategories.remove(at: index)
        } else { print("Category not found") }
    }
}
