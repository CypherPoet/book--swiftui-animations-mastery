//
// AnimationOptions_Challenge2Viewer+FooterView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 3/25/21.
// ✌️
//

import SwiftUI

fileprivate typealias FooterView = AnimationOptions_Challenge2Viewer.FooterView


extension AnimationOptions_Challenge2Viewer {
    
    public struct FooterView {
        public var initialDelay: TimeInterval
        public var totalAnimationDuration: TimeInterval
        
        @State private var buttonRotation: Angle = .radians(-.pi)
        @State private var containingFrameSize: CGSize = .zero
    }
}


// MARK: - `View` Body
extension FooterView: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {}, label: { buttonLabelView })
                .rotationEffect(buttonRotation)
        }
        .background(buttonStrobeTrack)
        .padding(.horizontal)
        .readingFrameSize({ newSize in
            containingFrameSize = newSize
        })
        .onAppear(perform: {
            withAnimation(
                .easeOut(duration: totalAnimationDuration)
                .delay(AnimationOptions_Challenge2Viewer.footerEntryDelay)
            ) {
                buttonRotation = .zero
            }
        })
    }
}


// MARK: - Computeds
extension FooterView {
    
    var strobeCircleEntryIncrement: TimeInterval {
        totalAnimationDuration / (
            Double(strobeCircleCount) * 2.25
        )
    }
    
    var strobeCircleDiameter: CGFloat {
        containingFrameSize.height / 1.25
    }
    
    var strobeCircleCount: Int {
        guard strobeCircleDiameter.isZero == false else { return 1 }
        
        return max(
            1,
            Int(containingFrameSize.width / strobeCircleDiameter) - 1
        )
    }
}


// MARK: - View Content Builders
private extension FooterView {
    
    var buttonLabelView: some View {
        Label(
            title: { Text("Next") },
            icon: {
                Image(systemName: "arrow.forward")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        )
        .foregroundColor(.primary)
        .background(Color.accentColor)
        .clipShape(Circle())
        .labelStyle(IconOnlyLabelStyle())
        .background(
            StrobingView(
                entryDelay: initialDelay + totalAnimationDuration + strobeCircleEntryIncrement,
//                minimumScale: 0.7,
                repeatMode: .forever,
                repeatDelay: 0.25
//                repeatMode: .times(4)
            ) {
                Circle()
//                    .stroke(Color.accentColor, lineWidth: strobeCircleDiameter * 0.2)
                    .fill(Color.accentColor)
                    .scaleEffect(1.5)
            }
        )
    }
    
    
    var strobeCircle: some View {
        Circle()
            .fill(Color.accentColor)
    }

    
    var buttonStrobeTrack: some View {
        GeometryReader { geometry in
            LazyHStack(spacing: 0) {
                ForEach(0 ..< strobeCircleCount, id: \.self) { circleIndex in
                    StrobingView(
                        entryDelay: (
                            Double(circleIndex) * strobeCircleEntryIncrement
                        ) + initialDelay
                    ) {
                        strobeCircle
                            .frame(
                                width: strobeCircleDiameter,
                                height: strobeCircleDiameter,
                                alignment: .center
                            )
                    }
                }
            }
        }
    }
}


// MARK: - Private Helpers
private extension FooterView {
    
}



#if DEBUG
// MARK: - Preview
struct AnimationOptions_Challenge2Viewer_FooterView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            FooterView(
                initialDelay: 0.7,
                totalAnimationDuration: 1.0
            )
                .frame(height: 164, alignment: .center)
            
            FooterView(
                initialDelay: 0.7,
                totalAnimationDuration: 1.0
            )
                .frame(height: 64, alignment: .center)
        }
    }
}
#endif
