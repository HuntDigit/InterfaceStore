//
//  HealthcareMainView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 04.09.2025.
//

import SwiftUI

struct HealthcareMainView: View {
    
    @State var searchText: String = ""
    @State var categories: [CategoryModel] = [
        .init(categoryType: .generalPractice),
        .init(categoryType: .cardiology),
        .init(categoryType: .orthopedics),
        .init(categoryType: .ophthalmology),
        .init(categoryType: .pediatrics)
    ]
    @State var selectedCategories: [CategoryModel] = []
    @State private var selection: TabBarItem = .home

    var body: some View {
        ZStack {
            CustomTabBarContainerView(selection: $selection) {
                VStack {
                    headerView
                    ScrollView {
                        LazyVStack(pinnedViews: .sectionHeaders) {
                            Section {
                                HealthcareAppointmentCardView(count: 3)
                            } header: {
                                VStack {
                                    groupHeaderView(text: "Recent Appointments",
                                                    buttonText: "View All") {
                                        // Action
                                    }
                                }
                                .padding(.vertical, 4)
                                .padding(.bottom, 8)
                                .background {
                                    headerBackground
                                }
                            }
                            Section {
                                ForEach(1..<10) { index in
                                    HealthcareDoctorCardView()
                                }
                            } header: {
                                VStack {
                                    groupHeaderView(text: "Doctors",
                                                    buttonText: "View All") {
                                        // Action
                                    }
                                    categoriesView
                                }
                                .padding(.vertical, 4)
                                .padding(.bottom, 8)
                                .background {
                                    headerBackground
                                }
                            }
                            
                        }
                        
                        Color.clear
                            .padding(.bottom, 90)
                    }
                    .scrollDismissesKeyboard(.interactively)
                }
                .tabBarItem(.home, selection: $selection)
                
                Color.orange
                    .ignoresSafeArea()
                    .tabBarItem(.favorites, selection: $selection)
                
                Color.green
                    .ignoresSafeArea()
                    .tabBarItem(.settings, selection: $selection)
            }
            .padding(.bottom, 4)
            .ignoresSafeArea(edges: .bottom)
        }
        .background {
            Color("backgroundMain")
                .ignoresSafeArea(edges: .all)
        }
    }
    
    var headerView: some View {
        VStack {
            HealthcareProfileView(avatarName: "female-doctor-avatar")
                .padding(.vertical, 10)
            HealthcareSearchView(searchText: $searchText)
                .padding(.horizontal, 16)
        }
    }

    func groupHeaderView(text: String,
                         buttonText: String? = nil,
                         action: @escaping () -> ()) -> some View {
        HStack {
            Text(text)
                .font(.satoshi(size: 22))
                .foregroundStyle(.black)
            
            Spacer()
            if let labelText = buttonText {
                Button {
                    action()
                } label: {
                    Text(labelText)
                        .font(.satoshi(size: 16))
                        .foregroundStyle(.gray)
                }
            }
        }
        .frame(minHeight: 44)
        .padding(.horizontal, 16)
    }
    
    var categoriesView: some View {
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
    

    
    var headerBackground: some View {
        LinearGradient(colors: [
            Color("backgroundMain"),
            Color("backgroundMain"),
            Color("backgroundMain").opacity(0.0)],
                       startPoint: .center,
                       endPoint: .bottom)
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



#Preview {
    HealthcareMainView()
}
