//
// AnimationOptions_Challenge2Viewer.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/24/21.
// ✌️
//

import SwiftUI
import SwiftUIStarterKit


struct AnimationOptions_Challenge2Viewer {
    @ScaledMetric(relativeTo: .body)
    private var baseFontSize: CGFloat = UIFont.preferredFont(forTextStyle: .body).pointSize
    
    @Environment(\.themeColors)
    private var themeColors
    
    @Environment(\.themeGradients)
    private var themeGradients
    
    @State private var isShowingMainDisplayContent: Bool = false
    @State private var isShowingFooterSection: Bool = false
    @State private var screenWidth: CGFloat = 0.0
}


// MARK: - Static Properties
extension AnimationOptions_Challenge2Viewer {
    static let mainContentEntryDelay: TimeInterval = 0.75
    static let mainDisplayAnimationDuration: TimeInterval = 0.435
    static let footerAnimationDuration: TimeInterval = 0.57
    static let footerEntryDelay: TimeInterval = mainDisplayAnimationDuration + mainContentEntryDelay + 0.25
    
    
    enum Animations {
        static let mainDisplayContentChange = Animation
            .spring(
                response: AnimationOptions_Challenge2Viewer.mainDisplayAnimationDuration,
                dampingFraction: 0.6,
                blendDuration: 0
            )
        
        
        static let footerContentSlide = Animation.interactiveSpring(
            response: AnimationOptions_Challenge2Viewer.footerAnimationDuration,
            dampingFraction: 0.89,
            blendDuration: 0
        )
    }
    
    
    enum BaseTransitions {
        static let mainDisplayContentInsertion = AnyTransition
            .opacity
            .combined(with: .scale(scale: 0.8))
        
        static let footerContentInsertion = AnyTransition.move(edge: .leading)
        static let footerContentRemoval = AnyTransition.opacity
    }
}


// MARK: - `View` Body
extension AnimationOptions_Challenge2Viewer: View {
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundGradient.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Challenge 2")
                    .screenBanner()
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, -16)
            .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: baseFontSize * 2) {
                Spacer()
                
                if isShowingMainDisplayContent {
                    Text("Welcome")
                        .font(.system(size: baseFontSize * 3, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(themeColors.secondaryAccent1)
                        .transition(mainDisplayContentTransition)
                }
                
                Spacer()
            }
            
            if isShowingFooterSection {
                FooterView(
                    initialDelay: Self.footerEntryDelay,
                    totalAnimationDuration: Self.footerAnimationDuration
                )
                    .frame(height: 64, alignment: .center)
                    .transition(footerContentTransition)
                    .zIndex(1)
            }
        }
        .readingFrameSize { newSize in
            screenWidth = newSize.width
        }
        .onAppear {
            withAnimation(
                Animations
                    .mainDisplayContentChange
                    .delay(Self.mainContentEntryDelay)
            ) {
                isShowingMainDisplayContent = true
            }
            
            withAnimation(
                Animations
                    .footerContentSlide
                    .delay(Self.footerEntryDelay)
            ) {
                isShowingFooterSection = true
            }
        }
    }
}


// MARK: - Computeds
extension AnimationOptions_Challenge2Viewer {
    
    var footerXOffset: CGFloat {
        -screenWidth * 4
    }
    
    var footerContentTransition: AnyTransition {
        BaseTransitions.footerContentInsertion
    }
    
    var mainDisplayContentTransition: AnyTransition {
        BaseTransitions
            .mainDisplayContentInsertion
    }
    
}


// MARK: - View Content Builders
private extension AnimationOptions_Challenge2Viewer {
    
    var backgroundGradient: some View {
        RadialGradient(
            gradient: themeGradients.screenBackground1,
            center: .center,
            startRadius: UIScreen.main.bounds.width * 0.28,
            endRadius: UIScreen.main.bounds.height * 3.297
        )
    }
}


// MARK: - Private Helpers
private extension AnimationOptions_Challenge2Viewer {
}


#if DEBUG

// MARK: - Preview

import SwiftUIPreviewUtils

struct AnimationOptions_Challenge2Viewer_Previews: PreviewProvider {
    
    static var previews: some View {
        AnimationOptions_Challenge2Viewer()
            .accentColor(ThemeColorGroups.theme1.primaryAccent)
            .openedFromNavigationLink(startsActive: true)
            .previewInColorSchemes(withLayout: .device)
    }
}
#endif
