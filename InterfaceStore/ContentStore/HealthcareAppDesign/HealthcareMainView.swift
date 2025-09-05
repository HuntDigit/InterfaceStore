//
//  HealthcareMainView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 04.09.2025.
//

import SwiftUI


struct AppointmentButtonStyleFilled: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.satoshi(size: 14))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(.blue)
            .background(Color.white)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct AppointmentButtonStyleTransparent: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.satoshi(size: 14))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(.white)
            .background(Color.white.opacity(0.2))
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct HealthcareMainView: View {
    
    @FocusState var isFocused
    @State var searchText: String = ""

    var body: some View {
        ZStack {
            VStack {
                headerView
                ScrollView {
                    LazyVStack {
                        groupHeaderView
                        appointmentCardView
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
    
    var groupHeaderView: some View {
        HStack {
            Text("Recent Appointments")
                .font(.satoshi(size: 22))
                .foregroundStyle(.black)
            
            Spacer()
            Button {
                // Action
            } label: {
                Text("See All")
                    .font(.satoshi(size: 16))
                    .foregroundStyle(.gray)
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
                    Button {
                        // action
                    } label: {
                        Image(systemName: "envelope")
                            .resizable()
                            .scaledToFit()
                            .padding(14)
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                            .padding(14)
                    }
                    
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
}



#Preview {
    HealthcareMainView()
}
