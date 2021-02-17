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
        @State private var isShowingSignUpButton2 = false
        @State private var actionButtonMaxWidth: CGFloat?
        
        @ScaledMetric private var bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        
        
        var initialDelay: TimeInterval
        var delayInterval: TimeInterval
        
        
        enum Durations {
            static let buttonSlide: TimeInterval = 0.6
        }
        
        enum Animations {
            static let loginButtonSlide = Animation
                .timingCurve(0.17, 0.67, 0.67, 1.19, duration: Durations.buttonSlide)
            
            static let signInButtonSlide = Animation
                .easeOut(duration: Durations.buttonSlide)
                .speed(1.25)
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
                        // 📝 TODO: Figure out why a specific `.scale` removal is the only thing that
                        // seems to let the view properly animate in.
                        // (And just this first view, not others)
                        // (And sometimes just on the Simulator, but not Previews)
                        // (Xcode 12.5 beta 1)
//                        removal: .opacity
                        removal: .scale
                    )
                )
                .readingMaxWidth { newWidth in
                    actionButtonMaxWidth = newWidth
                }
                .debugBorder(color: .white, width: 4)
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
                .readingMaxWidth { newWidth in
                    actionButtonMaxWidth = newWidth
                }
            }
        }
        .debugBorder(color: .blue)
        .onAppear {
            withAnimation (Animations.loginButtonSlide.delay(initialDelay + (delayInterval)))  {
                isShowingLoginButton = true
            }
            withAnimation (Animations.loginButtonSlide.delay(initialDelay + (delayInterval * 12)))  {
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
//        .move(edge: .leading)
        .slide
            .combined(with: .opacity)
//            .combined(with: .scale)
            //        .combined(with: .offset(CGSize(width: CGFloat(actionButtonMaxWidth ?? 0) * -4, height: 0)))
            .combined(with: .offset(CGSize(width: -400, height: 0)))
    }
    
    var signInButtonInsertion: AnyTransition {
        .move(edge: .bottom)
            .combined(with: .opacity)
            .combined(with: .scale)
            .combined(with: .offset(CGSize(width: 0, height: 400)))
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
