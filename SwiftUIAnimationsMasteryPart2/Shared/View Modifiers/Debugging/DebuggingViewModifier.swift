//
// DebuggingViewModifier.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/12/21.
// ✌️
//

import SwiftUI


extension View {

    @ViewBuilder
    func debuggingViewModifier<
        ModifiedView: View
    >(_ modifier: (Self) -> ModifiedView) -> some View {
        #if DEBUG
        if CommandLine.arguments.contains("-io.CypherPoet.SwiftUIDebuggingUtils.debugViewsEnabled") {
            modifier(self)
        } else {
            self
        }
        #else
            self
        #endif
    }
    
    
    func debugBorder(
        color: Color = .red,
        width: CGFloat = 1
    ) -> some View {
        debuggingViewModifier {
            $0.border(color, width: width)
        }
    }
    
    
    func debugBackground(
        color: Color = .red.opacity(0.73)
    ) -> some View {
        debuggingViewModifier {
            $0.background(color)
        }
    }
}
