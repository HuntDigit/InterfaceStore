//
//  PillowShape.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 28.08.2025.
//
import SwiftUI

struct PillowShape: Shape {
    private let offset: CGFloat = 10

    var pressure: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.minX + offset, y: rect.minY))
            path.addQuadCurve(to: .init(x: rect.maxX - offset,
                                        y: rect.minY),
                              control: .init(x: rect.midX,
                                             y: rect.minY + pressure))
        }
    }
    
}

#Preview("Pillow Shape") {
    UnevenRoundedRectangle(cornerRadii:
            .init(topLeading: 20,
                  bottomLeading: 0,
                  bottomTrailing: 0,
                  topTrailing: 20)
    )
    .subtracting(PillowShape(pressure: 20))
    .fill(Color.blue)
    .frame(width: 300, height: 400)
}
