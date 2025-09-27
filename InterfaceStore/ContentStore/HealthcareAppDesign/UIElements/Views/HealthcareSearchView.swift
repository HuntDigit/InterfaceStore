//
//  HealthcareSearchView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 27.09.2025.
//
import SwiftUI

struct HealthcareSearchView: View {
    
    @FocusState var isFocused
    @Binding var searchText: String
    
    var isButtonVisible: Bool = false
    var action: (() -> Void)? = nil
    
    //TODO: Add constants with all text
    let placeholderText: String = "Serch a doctor, drugs, etc..."
    
    init(searchText: Binding<String>, isButtonVisible: Bool = false, action:(() -> Void)? = nil) {
        _searchText = searchText
        
        self.isButtonVisible = isButtonVisible
        self.action = action
    }
    
    var body: some View {
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
                            Text(placeholderText)
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
            
            if isButtonVisible {
                Button {
                    action?()
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
            }
        }
    }
}
