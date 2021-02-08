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
        textColor: Color = .black,
        backgroundColor: Color = .accentColor,
        font: Font = .largeTitle
    ) -> some View {
        modifier(ScreenBannerViewModifier(
            textColor: textColor,
            backgroundColor: backgroundColor,
            font: font
        ))
    }
}
