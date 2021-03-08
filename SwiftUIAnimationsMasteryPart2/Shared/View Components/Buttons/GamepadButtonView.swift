//
// GamepadButtonView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/7/21.
// ✌️
//

import SwiftUI


struct GamepadButtonView {
    var gamepadButton: GamepadButton
    var onTap: () -> Void
}


// MARK: - `View` Body
extension GamepadButtonView: View {

    var body: some View {
        Button(
            action: onTap,
            label: {
                Label(
                    title: { Text(gamepadButton.description) },
                    icon: {
                        Image(systemName: gamepadButton.symbolName)
                            .resizable()
                            .scaledToFit()
                    }
                )
                .labelStyle(IconOnlyLabelStyle())
                .foregroundColor(Color(#colorLiteral(red: 0.07780180126, green: 0.0778228268, blue: 0.07779902965, alpha: 1)))
            }
        )
        .buttonStyle(
            ButtonStyles.GamepadButton(
//                backgroundColor: .primary,
//                backgroundColor: Color(#colorLiteral(red: 0.07780180126, green: 0.0778228268, blue: 0.07779902965, alpha: 1)),
                symbolColor: gamepadButton.symbolColor
            )
        )
    }
}


// MARK: - Computeds
extension GamepadButtonView {
}


// MARK: - View Content Builders
private extension GamepadButtonView {
}


// MARK: - Private Helpers
private extension GamepadButtonView {
}


#if DEBUG
// MARK: - Preview
struct GamepadButtonView_Previews: PreviewProvider {

    static var previews: some View {
        GamepadButtonView(
            gamepadButton: .circle,
            onTap: {}
        )
    }
}
#endif
