//
// ButtonStyles+GamepadButton.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/6/21.
// ✌️
//

import SwiftUI


extension ButtonStyles {
    
    struct GamepadButton: ButtonStyle {
        @ScaledMetric private var baseFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        
//        var backgroundColor: Color = .secondary
        var symbolColor: Color = .accentColor
        var maxWidth: CGFloat?

        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: maxWidth)
                .background(symbolColor.opacity(configuration.isPressed ? 0.875 : 1.0))
                .clipShape(Circle())
                .background(
                    Circle()
                        .shadow(
                            color: shadowColor,
                            radius: shadowRadius,
                            x: -shadowOffsetDistance,
                            y: -shadowOffsetDistance
                        )
                        .shadow(
                            color: shadowColor,
                            radius: shadowRadius,
                            x: shadowOffsetDistance,
                            y: shadowOffsetDistance
                        )
                )
                .opacity(configuration.isPressed ? 0.875 : 1.0)
                .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
        }
        
        
        private var shadowColor: Color { Color("GamepadShadow") }
        
        private var shadowOffsetDistance: CGFloat {
            baseFontSize * 0.1
        }
        
        private var shadowRadius: CGFloat {
            baseFontSize * 0.25
        }
    }
}
