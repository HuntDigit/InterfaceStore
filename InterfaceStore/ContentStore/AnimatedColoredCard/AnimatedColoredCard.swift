//
//  AnimatedColoredCard.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 18.10.2025.
//

import SwiftUI

enum CardColorSet {
    case defaultColors
    case multiColors
    case customColorSet([Color])
    
    var colorList: [Color] {
        switch self {
        case .defaultColors: defaultColors
        case .multiColors: multiColors
        case .customColorSet(let colors): colors
        }
    }
    
    private var defaultColors: [Color] {
         [Color.processingColor1,
          Color.processingColor2,
          Color.processingColor2,
          Color.processingColor3,
          Color.processingColor3,
          Color.processingColor1]
    }
    
    private var multiColors: [Color] {
        [Color.red,
         Color.orange,
         Color.orange,
         Color.yellow,
         Color.yellow,
         Color.blue,
         Color.blue,
         Color.green,
         Color.green,
         Color.purple,
         Color.purple,
         Color.red]
    }
}

struct AnimatedColoredCard: View {
        
    //Public
    public let lineWidth: CGFloat
    public let cornerRadius: CGFloat
    public let colorSet: CardColorSet
    public let speed: Double

    //Private
    @State private var rotationAngle: CGFloat
    
    init(lineWidth: CGFloat = 7,
         cornerRadius: CGFloat = 20,
         colorSet: CardColorSet = .defaultColors,
         rotationAngle: CGFloat = 0,
         speed: Double = 2) {
        self.lineWidth = lineWidth
        self.cornerRadius = cornerRadius
        self.colorSet = colorSet
        self.rotationAngle = rotationAngle
        self.speed = speed
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .foregroundStyle(.cardBackground)
                Text("CARD")
                    .font(.system(size: 40))
                    .foregroundStyle(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                Circle()
                    .frame(width: geo.size.hypo, height: geo.size.hypo)
                    .foregroundStyle(gradient)
                    .rotationEffect(.degrees(rotationAngle))
                    .mask {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .strokeBorder(style:
                                StrokeStyle(
                                    lineWidth: lineWidth,
                                    lineCap: .round,
                                    lineJoin: .miter,
                                    miterLimit: 0,
//                                    dash: [0],
                                    dashPhase: 0
                                )
                                          /* ^^^
                                           This is powerful settings we can use it for additional animation and variations of it
                                           */
                            )
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
            }
        }
        .onAppear() {
            withAnimation(
                .linear(duration: speed)
                .repeatForever(autoreverses: false)
            ) {
                rotationAngle = 360
            }
        }
    }
    
    var gradient: AngularGradient {
        AngularGradient(colors: colorSet.colorList, center: .center)
    }
}

extension CGSize {
    var hypo: CGFloat {
        sqrt(self.width * self.width + self.height * self.height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        
        VStack {
            AnimatedColoredCard(colorSet: .multiColors)
                .frame(width: 300, height: 400)
        }
    }
}
