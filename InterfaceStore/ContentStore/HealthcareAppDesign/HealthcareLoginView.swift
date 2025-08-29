//
//  HealthcareLoginView.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 25.08.2025.
//

import SwiftUI

struct MyButtonStyleFilled: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 24))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding([.leading, .trailing], 20)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct MyButtonStyleBlank: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 24))
            .frame(maxWidth:.infinity)
            .padding(16)
            .foregroundStyle(.blue)
            .background(Color.white)
            .clipShape(Capsule())
            .padding([.leading, .trailing], 20)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct HealthcareLoginView: View {
    private let coordinateSpaceName: NamedCoordinateSpace = .named("Screen")
    @State private var showContent = true
//    @State private var bottomInset: CGFloat = 0.0
    @State private var deafaultHeightOfCoverView: CGFloat = 300.0
    @State private var offsetOfCoverView: CGFloat = 0

    var body: some View {
//        GeometryReader { geometry in
            ZStack {
                background
                ScrollView {
                    VStack() {
                        customButton
                        customButton
                        customButton
                        customButton
                    }
                }
            }
            .safeAreaInset(edge: .top) { navigationView }
            .safeAreaInset(edge: .bottom) { coverSheet }
            .onAppear {
//                self.bottomInset =  geometry.safeAreaInsets.bottom
            }
//        }
    }

    var navigationView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack() {
                Text("")
                    .frame(height: 44)
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .shadow(color: .blue.opacity(0.5), radius: 5)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background() {
            //            Rectangle()
            //                .fill(.blue.opacity(0.6))
            //                .fill(.ultraThinMaterial)
            ZStack {
                UnevenRoundedRectangle(cornerRadii:
                        .init(topLeading: 20,
                              bottomLeading: 0,
                              bottomTrailing: 0,
                              topTrailing: 20)
                )
                .subtracting(PillowShape(pressure: 20))
                .fill(.clear)
                .stroke(.thinMaterial,
                        style: .init(lineWidth: 4),
                        antialiased: true)
                
                UnevenRoundedRectangle(cornerRadii:
                        .init(topLeading: 20,
                              bottomLeading: 0,
                              bottomTrailing: 0,
                              topTrailing: 20)
                )
                .subtracting(PillowShape(pressure: 20))
                .fill(.blue.opacity(0.6))
                .fill(.ultraThinMaterial)
            }
            .rotationEffect(.degrees(180))
            .ignoresSafeArea()
        }

    }
    
    var background: some View {
        LinearGradient(
            gradient: .init(colors: [.blue,.white.mix(with: .blue, by: 0.05)]),
            startPoint: .bottom,
            endPoint: .center)
        .ignoresSafeArea()
    }
    
    var coverSheet: some View {
        
        VStack(spacing: 16) {
            Spacer()
            Button(String.createAnAccountButtonTitle){/*Action*/}
                .buttonStyle(MyButtonStyleFilled())
            
            Button(String.skipButtonTitle) {/*Action*/}
                .buttonStyle(MyButtonStyleBlank())
 
            HStack() {
                Text(verbatim: .alreadyHaveAnAccountTipText)
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                Text(verbatim: .logInTipText)
                    .font(.system(size: 16))
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: deafaultHeightOfCoverView)
        .background(){
            ZStack {
                    UnevenRoundedRectangle(cornerRadii:
                        .init(topLeading: 20,
                              bottomLeading: 0,
                              bottomTrailing: 0,
                              topTrailing: 20)
                )
                .subtracting(PillowShape(pressure: 20))
                .fill(.clear)
                .stroke(.thinMaterial,
                        style: .init(lineWidth: 4),
                        antialiased: true)
                
                    UnevenRoundedRectangle(cornerRadii:
                        .init(topLeading: 20,
                              bottomLeading: 0,
                              bottomTrailing: 0,
                              topTrailing: 20)
                )
                .subtracting(PillowShape(pressure: 20))
                .fill(.blue.opacity(0.6))
                .fill(.ultraThinMaterial)
                
                VStack() {
                    Rectangle()
                        .fill(.clear)
                        .frame(maxWidth:.infinity)
                        .frame(height: 40)
                        .contentShape(Rectangle())
                        .overlay {
                            Capsule()
                                .fill(.regularMaterial)
                                .frame(width: 50, height: 4)
                        }
                    Spacer()
                }
                
                .gesture( DragGesture(coordinateSpace: .global)
                    .onChanged(onChanged)
                    .onEnded(onEnded)
                )
            }
            .ignoresSafeArea()
        }
//        .padding(.top, -bottomInset)
//        .offset(y: bottomInset)
    }
    
    var customButton: some View {
        EmptyView()
    }
    

}

//MARK: - Gesture Actions -

extension HealthcareLoginView {
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 { return }
        withAnimation(Animation.default.speed(5.0)) {
            deafaultHeightOfCoverView = 300 + (value.translation.height * -1)
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        withAnimation(Animation.default.speed(3.0)) {
            deafaultHeightOfCoverView = 300
        }
    }
}

//MARK: - Preview -

#Preview {
    HealthcareLoginView()
}
