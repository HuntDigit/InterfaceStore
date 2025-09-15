//
//  HealthcareMainView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 04.09.2025.
//

import SwiftUI

struct HealthcareMainView: View {
    
    @FocusState var isFocused
    @State var searchText: String = ""
    @State var categories: [CategoryModel] = [
        .init(categoryType: .generalPractice),
        .init(categoryType: .cardiology),
        .init(categoryType: .orthopedics),
        .init(categoryType: .ophthalmology),
        .init(categoryType: .pediatrics)
    ]
    @State var selectedCategories: [CategoryModel] = []

    var body: some View {
        ZStack {
            VStack {
                headerView
                ScrollView {
                    LazyVStack(pinnedViews: .sectionHeaders) {
                        Section {
                            appointmentCardView
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
                                doctorCardView
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
                }
            }
        }
        .background {
            Color("backgroundMain")
                .ignoresSafeArea(edges: .all)
        }
    }
    
    var headerView: some View {
        VStack {
            profileView
                .padding(.vertical, 10)
            searchView
        }
    }
    
    var profileView: some View {
        HStack(spacing: 0) {
            Image("female-doctor-avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .background(Color.green)
                .clipShape(Circle())
                .padding(.leading, 16)
                .padding(.trailing, 14)
            
            
            VStack(spacing: 8) {
                HStack(alignment: .lastTextBaseline) {
                    Text("Good morning!")
                        .font(.satoshi(size: 14))
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("Location")
                        .font(.satoshi(size: 14))
                        .foregroundStyle(.gray)
                    
                    
                }
                HStack(alignment: .lastTextBaseline) {
                    Text("Noah Turner")
                        .font(.satoshi(size: 20))
                        .foregroundStyle(.black)
                    Spacer()
                    Text("New Yourk, NY")
                        .font(.satoshi(size: 16))
                        .foregroundStyle(.black)
                }
            }
            .padding(.trailing, 16)
        }
    }
    
    var searchView: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.white)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .frame(width: 22, height: 22)
                        .padding(14)
                    ZStack(alignment: .leading) {
                        if !isFocused && searchText.isEmpty {
                            Text("Serch a doctor, drugs, etc...")
                                .font(.satoshi(size: 14))
                                .foregroundStyle(.gray.mix(with: .white, by: 0.4))
                                .padding(.vertical, 14)
                        }
                        TextField("", text: $searchText)
                            .font(.satoshi(size: 18))
                            .focused($isFocused)
                            .foregroundStyle(.gray)
                            .textFieldStyle(.plain)
                            .keyboardType(.default)
                            .padding(.vertical, 14)
                    }
                }
            }
            .frame(height: 64)
            .padding(.leading, 16)
            
            Button {
                // Action
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.white)
                    Image(systemName: "microphone")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .frame(width: 22, height: 22)
                        .padding(14)

                }
            }
            .frame(width: 64, height: 64)
            .padding(.trailing, 16)
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
    
    var appointmentCardView: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 24,
                             style: .circular)
            .fill(
                Color("appointmentBackgound0")
                    .mix(with: .white, by: 0.8)
            )
            .frame(maxWidth: .infinity)
            .scaleEffect(0.90)
            .offset(y: -30)
            
            RoundedRectangle(cornerRadius: 24,
                             style: .circular)
            .fill(
                Color("appointmentBackgound0")
                    .mix(with: .white, by: 0.6)
            )
            .frame(maxWidth: .infinity)
            .scaleEffect(0.95)
            .offset(y: -15)
            
            RoundedRectangle(cornerRadius: 24,
                             style: .circular)
            .fill(
                LinearGradient(
                    colors: [ Color("appointmentBackgound0"),
                              Color("appointmentBackgound1") ],
                    startPoint: .topLeading,
                    endPoint: .bottom)
            )
            .frame(maxWidth: .infinity)
            
            VStack {
                HStack {
                    Image("female-doctor-avatar-white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.leading, 16)
                        .padding(.trailing, 14)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Dr. Olivia Carter")
                            .font(.satoshi(size: 18))
                            .foregroundStyle(.white)
                        
                        Text("Nephrology")
                            .font(.satoshi(size: 14))
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    messageButton() {
                        // Action
                    }
                    .padding(14)
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal, 14)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Date")
                            .font(.satoshi(size: 16))
                            .foregroundStyle(.white.opacity(0.5))

                        Text("24 Apl. Monday")
                            .font(.satoshi(size: 14))
                            .foregroundStyle(.white)
                        
                        Button("Rescedule") {
                            // Action
                        }
                        .buttonStyle(AppointmentButtonStyleFilled())
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.satoshi(size: 16))
                            .foregroundStyle(.white.opacity(0.5))
                        
                        Text("10:00 AM - 11:00 AM")
                            .font(.satoshi(size: 14))
                            .foregroundStyle(.white)
                        
                        Button("View profile") {
                            // Action
                        }
                        .buttonStyle(AppointmentButtonStyleTransparent())
                    }
                }
                .padding(.horizontal, 14)
            }
            .padding(.vertical, 16)
        }
        .padding(16)
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
    
    var doctorCardView: some View {
        HStack(spacing: 8) {
            Image("female-doctor-avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 78, height: 78)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            VStack(alignment:  .leading) {
                Text("Dr. Deniel Raynolds")
                    .font(.satoshi(size: 16))
                    .foregroundColor(.black)
                Text("General Practitioner")
                    .font(.satoshi(size: 13))
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.yellow)
                    Text("4.7")
                        .font(.satoshi(size: 13))
                    RoundedRectangle(cornerRadius: 1)
                        .fill(Color(.gray).mix(with: .white, by: 0.5))
                        .font(.satoshi(size: 13))
                        .frame(width: 1)
                        .padding(4)
                    Text("120 reviews")
                        .font(.satoshi(size: 13))
                }
            }
            .padding(.vertical, 8)
            Spacer()
            VStack {
                messageButton(.green, .white) {
                    // Action
                }
                Spacer()
            }
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.white))
        }
        .padding(.horizontal, 12)
    }
    
    var headerBackground: some View {
        LinearGradient(colors: [
            Color("backgroundMain"),
            Color("backgroundMain"),
            Color("backgroundMain").opacity(0.0)],
                       startPoint: .center,
                       endPoint: .bottom)
    }
    
    func messageButton(_ background: Color = .white.opacity(0.2),
                       _ foreground: Color = .white,
                       action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .padding(14)
                .frame(width: 50, height: 50)
                .background(background)
                .foregroundStyle(foreground)
                .clipShape(Circle())
        }
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
