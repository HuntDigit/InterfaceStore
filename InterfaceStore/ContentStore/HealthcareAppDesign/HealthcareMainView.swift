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

    var body: some View {
        ZStack {
            Color("backgroundMain")
                .ignoresSafeArea(edges: .all)
            
            VStack {
                headerView
                Spacer()
            }
        }
    }
    
    var headerView: some View {
        VStack {
            profileView
                .padding(.vertical, 10)
            searchView
            Spacer()
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
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("Location")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    
                    
                }
                HStack(alignment: .lastTextBaseline) {
                    Text("Noah Turner")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    Spacer()
                    Text("New Yourk, NY")
                        .font(.system(size: 16))
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
                                .font(.system(size: 14))
                                .foregroundStyle(.gray.mix(with: .white, by: 0.4))
                                .padding(.vertical, 14)
                        }
                        TextField("", text: $searchText)
                            .font(.system(size: 18))
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
}



#Preview {
    HealthcareMainView()
}
