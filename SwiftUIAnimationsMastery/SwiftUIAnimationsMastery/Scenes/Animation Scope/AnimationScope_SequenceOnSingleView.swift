//
//  AnimationScope_SequenceOnSingleView.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/19/20.
// ✌️
//

import SwiftUI


struct AnimationScope_SequenceOnSingleView {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.colorScheme) private var colorScheme
    
    private let titleText = "Animation Scope"
    private let subtitleText = "Sequencing on Single View"
    private let descriptionText1 = "When using multiple `animation` modifiers, delays can help us choreograph a sequence."
    
    private let scaleDuration: TimeInterval = 0.5
    private let glimmerDuration: TimeInterval = 0.35
    
    @State private var isHeartEnlarged = false
}



// MARK: - View
extension AnimationScope_SequenceOnSingleView: View {

    var body: some View {
        VStack(spacing: 0) {
            descriptionSection
                .layoutPriority(2)
                
            mainImageSection
                .padding()

            Spacer()
            
            AnimationToggleButton { self.isHeartEnlarged.toggle() }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}



// MARK: - Computeds
extension AnimationScope_SequenceOnSingleView {
    
    var heartScaleAnimation: Animation {
        .spring(response: scaleDuration, dampingFraction: 0.43, blendDuration: scaleDuration / 2)
    }
    
    
    var heartGlimmerAnimation: Animation {
        .linear(duration: glimmerDuration)
    }
    
    
    var heartGlimmerDelay: TimeInterval {
        scaleDuration + 0.5
    }
}


// MARK: - View Variables
extension AnimationScope_SequenceOnSingleView {
    
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(
                text: descriptionText1,
                textColor: .white,
                backgroundColor: .purple,
                font: horizontalSizeClass == .regular ? .largeTitle : .title
            )
        }
    }
    
    
    private var heartImage: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundColor(.yellow)
            .scaleEffect(isHeartEnlarged ? 1.0 : 0.6)
            .animation(heartScaleAnimation)
            .scaledToFit()
    }
    
    
    private var mainImageSection: some View {
        GeometryReader { geometry in
            ZStack {
                self.heartImage
                
                Rectangle()
                    .fill(Color.white)
                    .frame(
                        width: geometry.size.width * 0.1,
                        height: 2000
                    )
                    .rotationEffect(.radians(-.pi / 4), anchor: .center)
                    .position(
                        x: self.isHeartEnlarged ?
                            geometry.frame(in: .global).minX
                            : geometry.frame(in: .global).maxX,
                        y: self.isHeartEnlarged ?
                            geometry.frame(in: .global).maxY
                            : geometry.frame(in: .global).minY - (geometry.size.height / 2)
                    )
                    .animation(self.heartGlimmerAnimation.delay(self.heartGlimmerDelay))
                    .opacity(self.isHeartEnlarged ? 1.0 : 0.0)  // fade out before heading back
                    .animation(.none)
            }
            .mask(self.heartImage)
        }
    }
}


// MARK: - Private Helpers
private extension AnimationScope_SequenceOnSingleView {
}


// MARK: - Preview
struct AnimationScope_SequenceOnSingleView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            AnimationScope_SequenceOnSingleView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
//        .colorScheme(.dark)
    }
}

