//
// ButtonStyles+FilledCallToActionButton.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/15/21.
// ✌️
//

import SwiftUI


extension ButtonStyles {
    
    struct FilledCallToAction: ButtonStyle {
        var textColor: Color = .primary
        var backgroundColor: Color = .accentColor
        var maxWidth: CGFloat?

        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: maxWidth)
                .customFont(.phosphateInline, size: 18)
                .foregroundColor(textColor.opacity(configuration.isPressed ? 0.5 : 1.0))
                .padding(.horizontal)
                .padding()
                .background(backgroundColor)
                .clipShape(
                    Capsule()
                )
                .shadow(color: .white.opacity(0.12), radius: 12, x: -2.0, y: -2.0)
                .shadow(color: Color(UIColor.systemGray).opacity(0.2), radius: 12, x: 2.0, y: 2.0)
                .background(backgroundColor.opacity(0.22).blur(radius: 22))
                .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
                .animation(.easeInOut(duration: 0.23), value: configuration.isPressed)
        }
    }
}
