//
//  CategotyModel.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 15.09.2025.
//

struct CategoryModel: Equatable, Hashable {
    var categoryType: CategoryType
    var isSelected: Bool = false
}

enum CategoryType: String, CaseIterable {
    case generalPractice = "General Practice"
    case cardiology      = "Cardiology"
    case orthopedics     = "Orthopedics"
    case ophthalmology   = "Ophthalmology"
    case pediatrics      = "Pediatrics"
}
