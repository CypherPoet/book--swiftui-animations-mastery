//
// ActionButton.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 12/1/20.
// ✌️
//

import SwiftUI


struct ActionButton {
    var onPress: () -> Void = {}
}


// MARK: - `View` Body
extension ActionButton: View {

    var body: some View {
        Button(
            action: onPress,
            label: {
                Label(
                    title: { Text("Animate") },
                    icon: { Text("🎬") }
                )
            }
        )
        .buttonStyle(CustomActionButtonStyle())
    }
}


// MARK: - Computeds
extension ActionButton {
}


// MARK: - View Variables
private extension ActionButton {
}


// MARK: - Private Helpers
private extension ActionButton {
}


#if DEBUG
// MARK: - Preview
struct ActionButton_Previews: PreviewProvider {

    static var previews: some View {
        ActionButton()
    }
}
#endif
