//
//  AnimatedColoredCard.swift
//  InterfaceStore
//
//  Created by Andrii Sabinin on 18.10.2025.
//

import SwiftUI

struct AnimatedColoredCard: View {
    @State var rotationAngle: CGFloat = 0
    
    let lineLenght: CGFloat = 20
    let cornerRadius: CGFloat = 20
    
//    let colors = [Color.red,
//                  Color.orange,
//                  Color.yellow,
//                  Color.blue,
//                  Color.green,
//                  Color.purple]
    
    let colors = [Color.processingColor1,
                  Color.processingColor2,
                  Color.processingColor3]
    
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
                            .stroke(lineWidth: 7)
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
            }
        }
        .onAppear() {
            withAnimation(
                .linear(duration: 2)
                .repeatForever(autoreverses: false)
            ) {
                rotationAngle = 360
            }
        }
    }
    
    var gradient: LinearGradient {
        LinearGradient(colors: colors,
                       startPoint: .bottom,
                       endPoint: .top )
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
            AnimatedColoredCard()
                .frame(width: 300, height: 400)
        }
    }
}
