//
// Sequencing_WithAnimation_Delay_ExampleView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/28/20.
// ✌️
//

import SwiftUI


fileprivate typealias ExampleView = AnimationScopeViewer.Sequencing_WithAnimation_Delay_ExampleView


extension AnimationScopeViewer {
    struct Sequencing_WithAnimation_Delay_ExampleView {
        @State private var animationProgress: CGFloat = 0.0
     
        @State private var isShowingCircle1 = false
        @State private var isShowingCircle2 = false
        @State private var isShowingCircle3 = false
    }
}


// MARK: - Static Properties
extension ExampleView {
    static let lightSwitchDuration: TimeInterval = 0.35
    
    static let lightSwitchAnimation = Animation
        .easeInOut(duration: lightSwitchDuration)
}


// MARK: - `View` Body
extension ExampleView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Spacer()
            
            CircleView(text: "🔋", isShowing: isShowingCircle1)
            CircleView(text: "🔋", isShowing: isShowingCircle2)
            CircleView(text: "🔋", isShowing: isShowingCircle3)
            
            Spacer()
            Spacer()

            ActionButton(onPress: performAnimation)
        }
        .padding()
        .padding(.vertical)
        .navigationTitle("withAnimation via Animation.delay")
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Computeds
extension ExampleView {
}


// MARK: - View Variables
private extension ExampleView {
    
    struct CircleView: View {
        var text: String
        var isShowing: Bool
        
        
        var body: some View {
            if isShowing {
                Circle()
                    .fill(Color.purple)
                    .overlay(
                        Text(text)
                            .font(.largeTitle)
                    )
                    .shadow(color: Color.purple, radius: 20, x: 0.0, y: 0.0)
                
            } else {
                Circle()
                    .fill(Color.gray)
                    .shadow(color: .gray, radius: 18, x: 0.0, y: 0.0)
                    .opacity(0.4)
            }
        }
    }
}


// MARK: - Private Helpers
private extension ExampleView {
    
    func performAnimation() {
        isShowingCircle1 = false
        isShowingCircle2 = false
        isShowingCircle3 = false
        
        withAnimation(Self.lightSwitchAnimation.delay(0.2)) {
            isShowingCircle1 = true
        }
        
        withAnimation(Self.lightSwitchAnimation.delay(1.0)) {
            isShowingCircle2 = true
        }
        
        withAnimation(Self.lightSwitchAnimation.delay(2.0)) {
            isShowingCircle3 = true
        }
    }
}


#if DEBUG
// MARK: - Preview
struct Sequencing_WithAnimation_Delay_ExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ExampleView()
        }
    }
}
#endif

