//
// AnimationOptions_ExerciseViewer+LoginFormView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/17/21.
// ✌️
//

import SwiftUI

fileprivate typealias LoginFormView = AnimationOptions_ExerciseViewer.LoginFormView


extension AnimationOptions_ExerciseViewer {

    struct LoginFormView {
        @State private var isShowingFields = false
        @State private var isShowingActionButtons = false
        @ScaledMetric private var bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize

        
        var initialDelay: TimeInterval
        
        
        enum Durations {
            static let textFieldSlide: TimeInterval = 0.6
        }

        enum Animations {
            static let textFieldSlide = Animation
                .timingCurve(0.17, 0.67, 0.67, 1.19, duration: Durations.textFieldSlide)
        }
    }
}


// MARK: - `View` Body
extension LoginFormView: View {

    var body: some View {
        VStack(spacing: bodyFontSize) {
            if isShowingFields {
                InputFieldsView(delayInterval: delayInterval)
                    .debugBorder(color: .purple, width: 2)
            }

            if isShowingActionButtons {
                ActionButtonsView(
                    initialDelay: delayInterval * 3,
                    delayInterval: delayInterval
                )
                .padding(.top, bodyFontSize)
                .debugBorder(color: .yellow, width: 2)
            }

            Spacer()
        }
        .onAppear {
            withAnimation(Animations.textFieldSlide.delay(initialDelay)) {
                isShowingFields = true
                isShowingActionButtons = true
            }
        }
        .onDisappear {
            withAnimation(Animations.textFieldSlide) {
                isShowingFields = false
                isShowingActionButtons = false
            }
        }
    }
}


// MARK: - Computeds
extension LoginFormView {

    var delayInterval: TimeInterval {
        Durations.textFieldSlide * 0.25
    }
}


// MARK: - View Content Builders
private extension LoginFormView {
}


// MARK: - Private Helpers
private extension LoginFormView {
}






#if DEBUG
// MARK: - Preview
struct AnimationOptions_ExerciseViewer_LoginFormView_Previews: PreviewProvider {

    static var previews: some View {
        LoginFormView(initialDelay: 0.4)
    }
}
#endif
