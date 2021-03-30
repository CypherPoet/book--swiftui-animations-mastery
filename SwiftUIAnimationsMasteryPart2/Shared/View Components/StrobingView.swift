//
// StrobingView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/30/21.
// ✌️
//

import SwiftUI
import SwiftUIStarterKit


public struct StrobingView<Content: View> {
    typealias Percentage = CGFloat
    
    public var entryDelay: TimeInterval
    public var visibleDuration: TimeInterval
    public var repeatMode: Animation.RepeatMode
    public var content: Content
    
    
    @State private var animationCompletion: Percentage = 0.0
    @State private var isVisible: Bool = false
    
    
    // MARK: - Init
    public init(
        entryDelay: TimeInterval = 0.0,
        visibleDuration: TimeInterval = 1.1,
        repeatMode: Animation.RepeatMode = .times(1),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.entryDelay = entryDelay
        self.visibleDuration = visibleDuration
        self.repeatMode = repeatMode
        self.content = content()
    }
}

// MARK: - `View` Body
extension StrobingView: View {
    
    
    public var body: some View {
        content
            .scaleEffect(max(animationCompletion, 0.001))
            .opacity(1.0 - Double(animationCompletion))
            .onAppear {
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + entryDelay
                ) {
                    withAnimation(strobeAnimation) {
                        animationCompletion = 1.0
                    }
                }
            }
    }
}


// MARK: - Computeds
extension StrobingView {
    
    var baseAnimation: Animation {
        .easeOut(duration: visibleDuration)
    }
    
    var strobeAnimation: Animation {
        switch repeatMode {
        case .never:
            return baseAnimation
        case .forever:
            return baseAnimation.repeatForever(autoreverses: false)
        case .times(let count):
            return baseAnimation.repeatCount(count, autoreverses: false)
        }
    }
}


// MARK: - View Content Builders
private extension StrobingView {
}


// MARK: - Private Helpers
private extension StrobingView {
}


extension Animation {
    public enum RepeatMode: Equatable {
        case times(Int)
        case forever
    }
}


extension Animation.RepeatMode {
    public static var once: Self { .times(1) }
    public static var never: Self { .times(0) }
}


#if DEBUG
// MARK: - Preview
struct StrobingView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            StrobingView {
                Text("Whoa")
            }
            
            StrobingView(
                repeatMode: .times(4)
            ) {
                Text("Whoa")
            }
            
            StrobingView(
                repeatMode: .forever
            ) {
                Text("Whoa")
            }
        }
    }
}
#endif
