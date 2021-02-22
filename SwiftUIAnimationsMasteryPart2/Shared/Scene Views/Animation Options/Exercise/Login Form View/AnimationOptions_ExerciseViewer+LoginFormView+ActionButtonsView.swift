//
// AnimationOptions_ExerciseViewer+LoginFormView+ActionButtonsView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/17/21.
// ✌️
//

import SwiftUI

fileprivate typealias ActionButtonsView = AnimationOptions_ExerciseViewer.LoginFormView.ActionButtonsView


extension AnimationOptions_ExerciseViewer.LoginFormView {
    
    struct ActionButtonsView {
        @State private var isShowingLoginButton = false
        @State private var isShowingSignUpButton = false
        @State private var actionButtonMaxWidth: CGFloat?
        @State private var insertionOffsetWidth = CGFloat(0.0)
        @State private var signUpButtonInsertionOffsetHeight = CGFloat(0.0)

        
        @ScaledMetric private var bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        
        
        var initialDelay: TimeInterval
        var delayInterval: TimeInterval
        
        
        enum Durations {
            static let buttonSlide: TimeInterval = 0.6
        }
        
        enum Animations {
            static let loginButtonSlide = Animation
                .timingCurve(0.17, 0.67, 0.67, 1.19, duration: Durations.buttonSlide)
            
            static let signInButtonSlide = loginButtonSlide
                .speed(1.5)
        }
    }
}


// MARK: - `View` Body
extension ActionButtonsView: View {
    
    var body: some View {
        VStack(spacing: bodyFontSize * 4) {
            
            if isShowingLoginButton {
                Button("Login") {
                    
                }
                .buttonStyle(
                    ButtonStyles.FilledCallToAction(maxWidth: actionButtonMaxWidth)
                )
                .transition(
                    .asymmetric(
                        insertion: loginButtonInsertion,
                        removal: loginButtonRemoval
                    )
                )
                .readingFrameSize { newSize in
                    insertionOffsetWidth = newSize.width
                }
                .readingMaxWidth { newWidth in
                    actionButtonMaxWidth = newWidth
                }
            }
            
            Spacer()
            
            if isShowingSignUpButton {
                Button("Or Signup") {
                    
                }
                .buttonStyle(ButtonStyles.OutlinedCallToAction(maxWidth: actionButtonMaxWidth))
                .transition(
                    .asymmetric(
                        insertion: signInButtonInsertion,
                        removal: .scale
                    )
                )
                .readingFrameSize { newSize in
                    insertionOffsetWidth = newSize.width
                }
                .readingMaxWidth { newWidth in
                    actionButtonMaxWidth = newWidth
                }
            }
        }
        .readingFrameSize { newSize in
            signUpButtonInsertionOffsetHeight = newSize.height
        }
        .onAppear {
            withAnimation (Animations.loginButtonSlide.delay(initialDelay + (delayInterval)))  {
                isShowingLoginButton = true
            }
            withAnimation (Animations.loginButtonSlide.delay(initialDelay + (delayInterval * 6)))  {
                isShowingSignUpButton = true
            }
        }
        .onDisappear {
            withAnimation (.easeIn(duration: Durations.buttonSlide))  {
                isShowingLoginButton = false
                isShowingSignUpButton = false
            }
        }
    }
}


// MARK: - Computeds
extension ActionButtonsView {
    
    var loginButtonInsertion: AnyTransition {
        .move(edge: .leading)
        .combined(with: .opacity)
        .combined(with: .offset(CGSize(width: -insertionOffsetWidth, height: 0)))
    }
    
    
    // 📝 TODO: Figure out why a specific `.scale` removal is the only thing that
    // seems to let the view properly animate in.
    // (And just this first view, not others)
    // (And sometimes just on the Simulator, but not Previews)
    // (Xcode 12.5 beta 2)
    var loginButtonRemoval: AnyTransition {
//        .move(edge: .leading)
//            .combined(with: .scale)
//        .combined(with: .opacity)
//        .combined(with: .offset(CGSize(width: insertionOffsetWidth, height: 0)))
        .scale
    }
    

    var signInButtonInsertion: AnyTransition {
        .move(edge: .bottom)
            .combined(with: .opacity)
            .combined(with: .offset(CGSize(width: 0, height: signUpButtonInsertionOffsetHeight)))
    }
}


// MARK: - View Content Builders
private extension ActionButtonsView {
}


// MARK: - Private Helpers
private extension ActionButtonsView {
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_ExerciseViewer_LoginFormView_ActionButtonsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ActionButtonsView(initialDelay: 0.8, delayInterval: 0.1)
    }
}
#endif
