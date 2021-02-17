//
// FrameSizePreferenceKey.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/15/21.
// ✌️
//

import SwiftUI


struct FrameSizePreferenceKey: PreferenceKey {
    static let defaultValue = CGSize.zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    }
}


extension View {
    
    func readingFrameSize(_ newSizeHandler: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear.preference(key: FrameSizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(FrameSizePreferenceKey.self, perform: newSizeHandler)
    }
}


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
