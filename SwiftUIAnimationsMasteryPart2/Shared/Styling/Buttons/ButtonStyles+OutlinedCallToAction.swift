//
// ButtonStyles+OutlinedCallToAction.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/28/20.
// ✌️
//

import SwiftUI


extension ButtonStyles {
    
    struct OutlinedCallToAction: ButtonStyle {
        var borderColor: Color = .secondary
        var textColor: Color = .accentColor
        var maxWidth: CGFloat?

        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: maxWidth)
                .customFont(.phosphateInline, size: 18)
                .foregroundColor(textColor.opacity(configuration.isPressed ? 0.5 : 1.0))
                .padding(.horizontal)
                .padding()
                .clipShape(
                    Capsule()
                )
                .overlay(
                    Capsule()
                        .strokeBorder(
                            borderColor.opacity(configuration.isPressed ? 0.5 : 1.0),
                            style: StrokeStyle(lineWidth: 2)
                        )
                        .shadow(color: .white.opacity(0.12), radius: 12, x: -2.0, y: -2.0)
                        .shadow(color: Color(UIColor.systemGray).opacity(0.2), radius: 12, x: 2.0, y: 2.0)
                )
                .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
                .animation(.easeInOut(duration: 0.23), value: configuration.isPressed)
        }
    }
}
