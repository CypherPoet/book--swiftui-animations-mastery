//
// ChallengeViewer.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/2/21.
// ✌️
//

import SwiftUI


struct AnimationOptions_ChallengeViewer {
    @ScaledMetric private var baseFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
    
    @State private var isGamepadMenuOpen = false
    @State private var lastPressedGamepadButton: GamepadButton?
    @State private var slideOutMenuWidth = CGFloat(0.0)
    
    @State private var isAnimatingMainDisplayContent = false
}


// MARK: - Static Properties
extension AnimationOptions_ChallengeViewer {
    static let buttonEntryDelay: TimeInterval = 0.35
    static let buttonExitDelay: TimeInterval = buttonEntryDelay * 0.421
    
    
    enum Animations {
        static let gamepadMenuSlideOut = Animation
            .spring(response: 0.35, dampingFraction: 0.78, blendDuration: 0)
        
        static let mainDisplayContentChange = Animation
//            .easeInOut(duration: 0.2)
            .spring(response: 0.35, dampingFraction: 0.78, blendDuration: 0)
        
        static let gamepadButtonPress = Animation.interactiveSpring()
    }
    
    
    enum Transitions {
        static let mainDisplayContent = AnyTransition
            .asymmetric(
                insertion: .opacity
                    .combined(with: .scale(scale: 0.75))
                    .animation(
                        Animations.mainDisplayContentChange
                            .delay(buttonEntryDelay * 0.7)
                    )
                ,
                removal: .opacity
                    .animation(.easeIn(duration: buttonExitDelay))
            )
    }
}



// MARK: - `View` Body
extension AnimationOptions_ChallengeViewer: View {
    
    var body: some View {
        VStack(spacing: baseFontSize * 2) {
            Text("Challenge")
                .screenBanner()
                .padding(.horizontal, horizontalPadding)
            
            
            mainContentSection
                .padding(.horizontal, horizontalPadding)
                .layoutPriority(1)
            
            
            SlideOutMenuView(
                isOpen: $isGamepadMenuOpen,
                onButtonPressed: handleGamepadButtonPress,
                onThumbTabPressed: handleThumbTabPress
            )
            .frame(height: baseFontSize * 4, alignment: .center)
            .offset(slideOutMenuOffset)
            .animation(
                Animations.gamepadMenuSlideOut
                    .delay(isGamepadMenuOpen ? 0.0 : Self.buttonExitDelay),
                value: isGamepadMenuOpen
            )
        }
        .readingFrameSize { newSize in
            slideOutMenuWidth = newSize.width
        }
        .padding(.top, baseFontSize * 6)
        .edgesIgnoringSafeArea(.top)
    }
}


// MARK: - Computeds
extension AnimationOptions_ChallengeViewer {
    
    var horizontalPadding: CGFloat {
        baseFontSize * 1.5
    }
    
    
    var slideOutMenuOffset: CGSize {
        let tabPeekingWidth = CGFloat(52)
        let endSpacing = CGFloat(horizontalPadding * 0.5)
        
        return CGSize(
            width: isGamepadMenuOpen ? -endSpacing : (-slideOutMenuWidth + tabPeekingWidth),
            height : 0
        )
    }
}


// MARK: - View Content Builders
private extension AnimationOptions_ChallengeViewer {
    
    private var mainContentSection: some View {
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .opacity(0.13)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .opacity(0.13)
                    .blur(radius: slideOutMenuWidth * 0.2)
            )
            .overlay(
                currentMainContent,
                alignment: .center
            )
    }
    
    
    @ViewBuilder
    private var currentMainContent: some View {
        if isGamepadMenuOpen {
            Group {
                if let gamepadButton = lastPressedGamepadButton {
                    GamepadButtonPresentationView(gamepadButton: gamepadButton)
                        .scaleEffect(isAnimatingMainDisplayContent ? 0.9 : 1.0)
                        .animation(.interactiveSpring(), value: isAnimatingMainDisplayContent)
                        .onChange(of: isAnimatingMainDisplayContent, perform: { value in
                            if isAnimatingMainDisplayContent {
                                isAnimatingMainDisplayContent = false
                            }
                        })
                } else {
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .scaledToFit()
                }
            }
            .transition(Transitions.mainDisplayContent)
            .padding()
        } else {
            challengeDescriptionView
                .transition(Transitions.mainDisplayContent)
                .padding(.horizontal)
        }
    }
    
    
    var challengeDescriptionView: some View {
        let checkMarkView = Text("\(Image(systemName: "checkmark.circle"))  ")
            .foregroundColor(.accentColor)
        
        return VStack(spacing: baseFontSize * (Typography.lineHeightMultiplier * 2.0)) {
            Spacer()

            Text("Gamepad Slide-Out Menu")
                //                .customFont(.phosphateInline, size: Typography.FontSizes.title2)
                .customFont(.phosphateInline, size: 22)

            
            VStack(alignment: .leading, spacing: baseFontSize * Typography.lineHeightMultiplier) {
                checkMarkView
                    + Text("When you tap on the 3 lines, a view slides out.")
                
                checkMarkView
                    + Text("The images/buttons fade in only AFTER the view is done sliding out.")
                
                checkMarkView
                    + Text("You can use any colors you want.")
                
                checkMarkView
                    + Text("Use any images you want.")
                
                checkMarkView
                    + Text("Try to keep this slide-out menu width dynamic if you can so it will scroll out to fill the entire width of the screen.")
                
                Spacer()
            }
        }
    }
}


// MARK: - Private Helpers
private extension AnimationOptions_ChallengeViewer {
    
    func handleGamepadButtonPress(_ button: GamepadButton) {
        lastPressedGamepadButton = button
  
        withAnimation(Animations.gamepadButtonPress) {
            isAnimatingMainDisplayContent = true
        }
    }
    
    
    func handleThumbTabPress() {
        if isGamepadMenuOpen {
            lastPressedGamepadButton = .none
        }
        
        isGamepadMenuOpen.toggle()
    }
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_ChallengeViewer_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            AnimationOptions_ChallengeViewer()
                .openedFromNavigationLink(startsActive: true)
                .preferredColorScheme(.dark)
            
            AnimationOptions_ChallengeViewer()
                .openedFromNavigationLink(startsActive: false)
                .preferredColorScheme(.light)
        }
    }
}
#endif


struct OpenedFromNavigationLinkViewModifier {
    @State private var isActive: Bool
    
    
    init(
        startsActive: Bool = true
    ) {
        self._isActive = .init(initialValue: startsActive)
    }
}


extension OpenedFromNavigationLinkViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: content,
                    isActive: $isActive,
                    label: {
                        Text("Navigate to View")
                    }
                )
            }
            .navigationTitle("SwiftUI Previews ⚡️")
        }
    }
}

extension View {
    
    func openedFromNavigationLink(startsActive: Bool = true) -> some View {
        modifier(
            OpenedFromNavigationLinkViewModifier(
                startsActive: startsActive
            )
        )
    }
}
