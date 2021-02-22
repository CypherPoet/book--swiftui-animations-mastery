//
// View+ScreenBanner.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/5/21.
// ✌️
//

import SwiftUI


extension View {
    
    func screenBanner(
        textColor: Color = .primary,
        backgroundColor: Color = .accentColor,
        font: Font = .custom(CustomFont.phosphateSolid.name, size: 36)
    ) -> some View {
        modifier(ScreenBannerViewModifier(
            textColor: textColor,
            backgroundColor: backgroundColor,
            font: font
        ))
    }
}
