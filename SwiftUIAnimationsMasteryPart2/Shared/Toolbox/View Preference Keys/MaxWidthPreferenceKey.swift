//
// MaxWidthPreferenceKey.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/20/21.
// ✌️
//

import SwiftUI


struct MaxWidthPreferenceKey: PreferenceKey {
    static let defaultValue = CGFloat(0.0)
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}


extension View {
    
    func readingMaxWidth(_ newWidthHandler: @escaping (CGFloat) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                Color
                    .clear
                    .preference(key: MaxWidthPreferenceKey.self, value: geometry.size.width)
            }
        )
        .onPreferenceChange(MaxWidthPreferenceKey.self, perform: newWidthHandler)
    }
}
