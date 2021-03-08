//
// ChallengeViewer+SlideOutMenuView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/3/21.
// ✌️
//

import SwiftUI

fileprivate typealias SlideOutMenuView = AnimationOptions_ChallengeViewer.SlideOutMenuView


extension AnimationOptions_ChallengeViewer {
    
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
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color(.tertiarySystemGroupedBackground))
            .overlay(
                HStack {
                    slideOutMenuButtons
                        .padding(.vertical)

                    MenuNotchesView()
                        .padding(.vertical, (frameHeight ?? 0) * 0.125)
                        .padding(.trailing, (frameHeight ?? 0) * 0.25)
                        .frame(height: frameHeight)
                        .onTapGesture(perform: onThumbTabPressed)
                }
                .padding(.leading, (frameHeight ?? 0) * 0.25)
            )
            .readingFrameSize { newSize in
                frameHeight = newSize.height
            }
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
                                AnimationOptions_ChallengeViewer.Animations.gamepadMenuSlideOut
                                    .delay(
                                        AnimationOptions_ChallengeViewer.buttonEntryDelay
                                            + (Double(index) * 0.08)
                                    )
                            )
                        ,
                        removal: .opacity
                            .combined(with: .move(edge: .leading))
                            .animation(.linear(duration: AnimationOptions_ChallengeViewer.buttonExitDelay))
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
                    .foregroundColor(Color("SecondaryAccent1"))
                    .frame(width: 3, alignment: .center)
                    .scaleEffect(
                        x: 1.0,
                        y: CGFloat(1.0) - CGFloat(Double(index) * 0.12),
                        anchor: .center
                    )
            }
        }
    }
}



#if DEBUG
// MARK: - Preview
struct ChallengeViewer_SlideOutMenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            SlideOutMenuView(
                isOpen: .constant(true)
            )
            .preferredColorScheme(.dark)
            .previewDisplayName("Color Scheme: dark")
            
            SlideOutMenuView(
                isOpen: .constant(true)
            )
            .preferredColorScheme(.light)
            .previewDisplayName("Color Scheme: light")
            
            SlideOutMenuView(
                isOpen: .constant(false)
            )
            .preferredColorScheme(.dark)
            .previewDisplayName("Color Scheme: dark")
            
            SlideOutMenuView(
                isOpen: .constant(false)
            )
            .preferredColorScheme(.light)
            .previewDisplayName("Color Scheme: light")
        }
        .frame(height: 54)
        .previewLayout(.sizeThatFits)
    }
}
#endif

