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
                                    HealthcareGroupHeaderView(text: "Recent Appointments",
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
                                    HealthcareGroupHeaderView(text: "Doctors",
                                                              buttonText: "View All") {
                                        // Action
                                    }
                                    HealthcareCategoriesView(categories: $categories,
                                                             selectedCategories: $selectedCategories)
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
        .onAppear(){

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
    
    var headerBackground: some View {
        LinearGradient(colors: [
            Color("backgroundMain"),
            Color("backgroundMain"),
            Color("backgroundMain").opacity(0.0)],
                       startPoint: .center,
                       endPoint: .bottom)
    }
}

#Preview {
    HealthcareMainView()
}
