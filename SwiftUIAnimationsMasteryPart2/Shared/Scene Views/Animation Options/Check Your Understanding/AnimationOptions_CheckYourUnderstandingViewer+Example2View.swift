//
// AnimationOptions_CheckYourUnderstandingViewer+Example2View.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/22/21.
// ✌️
//

import SwiftUI

fileprivate typealias Example2View = AnimationOptions_CheckYourUnderstandingViewer.Example2View


extension AnimationOptions_CheckYourUnderstandingViewer {
    
    struct Example2View {
        @ScaledMetric private var baseFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        
        @State private var hueRotationAngle = Angle()
        
        static let hueRotationAnimation = Animation
            .linear(duration: 1.0)
            .repeatForever(autoreverses: false)
    }
}


// MARK: - `View` Body
extension Example2View: View {
    
    var body: some View {
        VStack(spacing: baseFontSize * 2) {
            Text("Check Understanding 2")
                .screenBanner()
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
            
            
            VStack(spacing: baseFontSize) {
                Text("Prevent Animation")
                    .customFont(.phosphateSolid, size: 24)
                
                Text("Challenge: Rotate the hue continuously so that it's always going in one direction.")
                    .font(.subheadline)
            }
            
            ScreenSectionDivider()
            
            VStack {
                Rectangle()
                    .fill(circleGradient)
                    .hueRotation(hueRotationAngle)
                    .animation(Self.hueRotationAnimation, value: hueRotationAngle)
                    .mask(
                        Text("Swift UI \(Image(systemName: "bolt.fill"))")
                            .customFont(.phosphateSolid, size: 48)
                            .foregroundColor(.primary)
                    )
                
                Circle()
                    .fill(circleGradient)
                    .hueRotation(hueRotationAngle)
                    .animation(Self.hueRotationAnimation, value: hueRotationAngle)
                    .frame(minWidth: 200, alignment: .center)
                    .padding(.horizontal, baseFontSize * 4)
            }
            
            Spacer()
            
            AnimationActionButton {
                hueRotationAngle = .radians(2 * .pi)
            }
            
            Spacer()
        }
    }
}


// MARK: - Computeds
extension Example2View {
}


// MARK: - View Content Builders
private extension Example2View {
    
    var circleGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    .yellow,
                    .green,
                    .blue,
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}


// MARK: - Private Helpers
private extension Example2View {
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_CheckYourUnderstandingViewer_Example2View_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            Example2View()
                .preferredColorScheme(.dark)
        }
        
    }
}
#endif
