//
// Challenge1Viewer+GamepadButtonPresentationView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/5/21.
// ✌️
//

import SwiftUI

fileprivate typealias GamepadButtonPresentationView = AnimationOptions_Challenge1Viewer.GamepadButtonPresentationView


extension AnimationOptions_Challenge1Viewer {
    
    struct GamepadButtonPresentationView {
        var gamepadButton: GamepadButton
    }
}


// MARK: - `View` Body
extension GamepadButtonPresentationView: View {
    
    var body: some View {
        GamepadButtonView(gamepadButton: gamepadButton)
            .disabled(true)
    }
}


// MARK: - Computeds
extension GamepadButtonPresentationView {
}


// MARK: - View Content Builders
private extension GamepadButtonPresentationView {
}


// MARK: - Private Helpers
private extension GamepadButtonPresentationView {
}


#if DEBUG
// MARK: - Preview
struct GamepadButtonPresentationView_Previews: PreviewProvider {
    
    static var previews: some View {
        GamepadButtonPresentationView(gamepadButton: .circle)
    }
}
#endif
