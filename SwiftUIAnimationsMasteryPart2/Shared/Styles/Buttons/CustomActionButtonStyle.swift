//
// CustomActionButtonStyle.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/28/20.
// ✌️
//

import SwiftUI


struct CustomActionButtonStyle: ButtonStyle {
    var borderColor: Color = .accentColor
    var textColor: Color = .accentColor
    
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(textColor.opacity(configuration.isPressed ? 0.5 : 1.0))
            .padding(.horizontal)
            .padding()
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(
                        borderColor.opacity(configuration.isPressed ? 0.5 : 1.0),
                        style: StrokeStyle(lineWidth: 2)
                    )
                    .shadow(color: Color(UIColor.systemGray), radius: 4, x: 2.0, y: 2.0)
            )
            .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
    }
}
