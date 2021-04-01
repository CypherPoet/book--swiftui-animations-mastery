//
// Challenge1Viewer+SlideOutMenuView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/3/21.
// ✌️
//

import SwiftUI
import SwiftUIStarterKit
import SwiftUICurvedRectangleShape

fileprivate typealias SlideOutMenuView = AnimationOptions_Challenge1Viewer.SlideOutMenuView


extension AnimationOptions_Challenge1Viewer {
    
    struct SlideOutMenuView {
        
        @Binding
        var isOpen: Bool
        
        var onButtonPressed: (GamepadButton) -> Void
        var onThumbTabPressed: () -> Void
        
        @State private var isShowingButtons = false
        @State private var frameHeight: CGFloat?
        
        
        // MARK: - Init
        init(
            isOpen: Binding<Bool>,
            onButtonPressed: @escaping (GamepadButton) -> Void = { _ in },
            onThumbTabPressed: @escaping () -> Void = { }
        ) {
            self._isOpen = isOpen
            self.onButtonPressed = onButtonPressed
            self.onThumbTabPressed = onThumbTabPressed
        }
    }
}


// MARK: - `View` Body
extension SlideOutMenuView: View {
    
    var body: some View {
        CurvedRectangle(
            curveAxis: .horizontal, leadingDepthPercentage: 0, trailingDepthPercentage: 3.25
        )
        .fill(Color.primary)
        .overlay(
            HStack {
                slideOutMenuButtons
                    .padding(.vertical)
                
                MenuNotchesView()
                    .padding(.vertical, (frameHeight ?? 0) * 0.18)
                    .padding(.trailing, (frameHeight ?? 0) * 0.25)
                    .frame(height: frameHeight)
                    .onTapGesture(perform: onThumbTabPressed)
            }
            .padding(.leading, (frameHeight ?? 0) * 0.25)
        )
        .readingFrameSize { newSize in
            frameHeight = newSize.height
        }
        .shadow(color: Color("Theme1-PrimaryAccent").opacity(0.2), radius: 10, x: 0.0, y: 0.0)
    }
}


// MARK: - Computeds
extension SlideOutMenuView {
}


// MARK: - View Content Builders
private extension SlideOutMenuView {
    
    var slideOutMenuButtons: some View {
        ForEach(0..<GamepadButton.allCases.count) { index in
            Spacer()
            
            if isOpen {
                GamepadButtonView(
                    gamepadButton: GamepadButton.allCases[index],
                    onTap: { onButtonPressed(GamepadButton.allCases[index]) }
                )
                .frame(minWidth: 44, minHeight: 44)
                .transition(
                    .asymmetric(
                        insertion: .opacity
                            .combined(with: .scale)
                            .animation(
                                AnimationOptions_Challenge1Viewer.Animations.gamepadMenuSlideOut
                                    .delay(
                                        AnimationOptions_Challenge1Viewer.buttonEntryDelay
                                            + (Double(index) * 0.08)
                                    )
                            )
                        ,
                        removal: .opacity
                            .combined(with: .move(edge: .leading))
                            .animation(.easeIn(duration: AnimationOptions_Challenge1Viewer.buttonExitDelay))
                    )
                )
                
                Spacer()
            }
        }
    }
}


// MARK: - Private Helpers
private extension SlideOutMenuView {
    
}


private struct MenuNotchesView: View {
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0...3, id: \.self) { index in
                Capsule()
                    .foregroundColor(Color("Theme1-PrimaryAccent"))
                    .frame(width: 3, alignment: .center)
                    .scaleEffect(
                        x: 1.0,
                        y: CGFloat(1.0) - CGFloat(Double(index) * 0.08),
                        anchor: .center
                    )
            }
        }
    }
}



#if DEBUG
// MARK: - Preview
struct Challenge1Viewer_SlideOutMenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            SlideOutMenuView(
                isOpen: .constant(true)
            )
            
            SlideOutMenuView(
                isOpen: .constant(true)
            )
        }
        .frame(height: 54)
        .previewInColorSchemes()
        .previewLayout(.sizeThatFits)
    }
}
#endif

