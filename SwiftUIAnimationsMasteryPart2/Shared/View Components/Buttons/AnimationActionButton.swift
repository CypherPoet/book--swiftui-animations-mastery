//
// AnimationActionButton.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 12/1/20.
// ✌️
//

import SwiftUI


struct AnimationActionButton {
    var onPress: () -> Void = {}
}


// MARK: - `View` Body
extension AnimationActionButton: View {

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
        .buttonStyle(ButtonStyles.OutlinedCallToAction())
    }
}


// MARK: - Computeds
extension AnimationActionButton {
}


// MARK: - View Variables
private extension AnimationActionButton {
}


// MARK: - Private Helpers
private extension AnimationActionButton {
}


#if DEBUG
// MARK: - Preview
struct AnimationActionButton_Previews: PreviewProvider {

    static var previews: some View {
        AnimationActionButton()
    }
}
#endif
