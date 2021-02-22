//
// AnimationOptions_CheckYourUnderstandingViewer+Example1View.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/22/21.
// ✌️
//

import SwiftUI

fileprivate typealias Example1View = AnimationOptions_CheckYourUnderstandingViewer.Example1View


extension AnimationOptions_CheckYourUnderstandingViewer {
    
    struct Example1View {
        @ScaledMetric private var baseFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        
        @State private var isRounded = false
        @State private var rectangleWidth = CGFloat(100)
    }
}


// MARK: - `View` Body
extension Example1View: View {
    
    var body: some View {
        VStack(spacing: baseFontSize * 2) {
            Text("Check Understanding 1")
                .screenBanner()
                .padding(.horizontal)
            
            
            VStack(spacing: baseFontSize) {
                Text("Prevent Animation")
                    .font(.title2)
                
                Text("Challenge: Animate the corner radius change but NOT the color change in the rectangle.")
                    .font(.subheadline)
            }
            
            ScreenSectionDivider()
            
            
            RoundedRectangle(cornerRadius: cornerRadiusRoundingAmount)
                .animation(.easeInOut(duration: 2.0), value: isRounded)
                .foregroundColor(rectangleColor)
                .frame(minWidth: 200, minHeight: 100, maxHeight: 100, alignment: .center)
                .padding(.horizontal, baseFontSize * 4)
            
            Spacer()
            
            AnimationActionButton {
                //                withAnimation(.easeInOut(duration: 2.0)) {
                isRounded.toggle()
                //                }
            }
            
            Spacer()
        }
    }
}


// MARK: - Computeds
extension Example1View {
    
    var cornerRadiusRoundingAmount: CGFloat {
        isRounded ? (rectangleWidth / 4) : 0
    }
    
    var rectangleColor: Color {
        isRounded ? .purple : .orange.opacity(0.8)
    }
}


// MARK: - View Content Builders
private extension Example1View {
}


// MARK: - Private Helpers
private extension Example1View {
}


#if DEBUG
// MARK: - Preview
struct AnimationOptions_CheckYourUnderstandingViewer_Example1View_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            Example1View()
                .preferredColorScheme(.dark)
        }
    }
}
#endif
