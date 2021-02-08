//
// ConditionallyAppliedViewModifier.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 1/31/21.
// ✌️
//

import SwiftUI


extension View {
    
    @ViewBuilder
    func depending<ModifierIfTrue, ModifierIfFalse>(
        onWhether condition: Bool,
        apply modifierIfTrue: ModifierIfTrue,
        or modifierIfFalse: ModifierIfFalse
    ) -> some View where
        ModifierIfTrue: ViewModifier,
        ModifierIfFalse: ViewModifier
    {
        if condition {
            modifier(modifierIfTrue)
        } else {
            modifier(modifierIfFalse)
        }
    }
}


