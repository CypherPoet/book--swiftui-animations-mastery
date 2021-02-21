//
// AnimationOptions_ExerciseViewer+LoginFormView+InputFieldsView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/17/21.
// ✌️
//

import SwiftUI

fileprivate typealias InputFieldsView = AnimationOptions_ExerciseViewer.LoginFormView.InputFieldsView


extension AnimationOptions_ExerciseViewer.LoginFormView {
    
    struct InputFieldsView {
        @State private var isShowingEmailField = false
        @State private var isShowingPasswordField = false
        @State private var insertionOffsetWidth = CGFloat(0.0)
        
        var delayInterval: TimeInterval
        
        
        enum Durations {
            static let fieldSlide: TimeInterval = 0.6
        }
        
        enum Animations {
            static let fieldSlide = Animation
                .timingCurve(0.17, 0.67, 0.67, 1.19, duration: Durations.fieldSlide)
        }
    }
}


// MARK: - `View` Body
extension InputFieldsView: View {
    
    var body: some View {
        VStack {
            if isShowingEmailField {
                TextField("Email", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .transition(
                        .asymmetric(insertion: fieldInsertion, removal: fieldRemoval)
                    )
            }
            
            if isShowingPasswordField {
                SecureField("Password", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .transition(
                        .asymmetric(insertion: fieldInsertion, removal: fieldRemoval)
                    )
            }
        }
        .readingFrameSize { newSize in
            insertionOffsetWidth = newSize.width
        }
        .onAppear {
            withAnimation(Animations.fieldSlide.delay(delayInterval)) {
                isShowingEmailField = true
            }
            withAnimation(Animations.fieldSlide.delay(delayInterval * 2)) {
                isShowingPasswordField = true
            }
        }
        .onDisappear {
            withAnimation(Animations.fieldSlide) {
                isShowingEmailField = false
                isShowingPasswordField = false
            }
        }
    }
}


// MARK: - Computeds
extension InputFieldsView {
    
    var fieldInsertion: AnyTransition {
        .slide
        .combined(with: .opacity)
        .combined(with: .offset(CGSize(width: -insertionOffsetWidth, height: 0)))
    }
    
    var fieldRemoval: AnyTransition {
        .slide
        .combined(with: .opacity)
        .combined(with: .offset(CGSize(width: insertionOffsetWidth, height: 0)))
    }
}


// MARK: - View Content Builders
private extension InputFieldsView {
}


// MARK: - Private Helpers
private extension InputFieldsView {
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_ExerciseViewer_LoginFormView_InputFieldsView_Previews: PreviewProvider {
    
    static var previews: some View {
        InputFieldsView(delayInterval: 1.0)
    }
}
#endif
