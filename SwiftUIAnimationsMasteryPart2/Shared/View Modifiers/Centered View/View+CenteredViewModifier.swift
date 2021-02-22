//
// View+CenteredViewModifier.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/22/21.
// ✌️
//

import SwiftUI


extension View {
    
    func centered(
        _ alignmentKind: CenteredViewModifier.AlignmentKind
    ) -> some View {
        modifier(
            CenteredViewModifier(
                alignment: alignmentKind
            )
        )
    }
    
}
