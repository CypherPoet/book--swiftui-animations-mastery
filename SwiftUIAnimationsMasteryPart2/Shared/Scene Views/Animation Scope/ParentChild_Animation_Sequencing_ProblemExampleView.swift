//
// ParentChild_Animation_Sequencing_ProblemExampleView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/3/21.
// ✌️
//

import SwiftUI


struct ParentChild_Animation_Sequencing_ProblemExampleView {
    @State private var isInfoPanelExpanded = false
}



// MARK: - `View` Body
extension ParentChild_Animation_Sequencing_ProblemExampleView: View {
    
    var body: some View {
        VStack {
            Text("Sequencing Parent and Child Views")
                .screenBanner(backgroundColor: .accentColor)
            
            ScreenSectionDivider()
                .padding(.vertical)
            
            VStack(spacing: 18.0) {
                Text("""
                Sometimes, withAnimation is the only solution when you want to \
                animate a child view independently of a parent view.
                """
                )
                
                ScreenSectionDivider()
                
                Text("""
                What we want is for the view to slide up, and THEN have the child views appear. \
                Look what happens when we try to accomplish without withAnimation.
                """
                )
                
                ScreenSectionDivider()
            }
            .padding(.horizontal)
            
            GeometryReader { geometry in
                infoPanel
                    .offset(panelOffset(in: geometry))
            }
        }
        .multilineTextAlignment(.leading)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true)
    }
}


// MARK: - Computeds
extension ParentChild_Animation_Sequencing_ProblemExampleView {
    
    func panelOffset(in geometry: GeometryProxy) -> CGSize {
        let frame = geometry.frame(in: .global)
        
        return .init(
            width: isInfoPanelExpanded ? 15 : frame.width - 60,
            height: isInfoPanelExpanded ? 15 : frame.height - 60
        )
    }
}


// MARK: - View Content Builders
private extension ParentChild_Animation_Sequencing_ProblemExampleView {
    
    
    var infoPanel: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: "info.circle")
                Text("Login Help")
                Spacer()
            }
            .font(.title)
            .padding()
            
            VStack(spacing: 10) {
                Image(systemName: "slider.horizontal.3").font(.largeTitle)
                
                Text("""
                We want this to JUST fade in after the parent is done animating out.

                Instead, the animation delay causes the offset change to be triggered \
                too late, and it ends up running alongside the opacity change.
                """
                )
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).opacity(0.1))
            .padding(.horizontal)
            .opacity(isInfoPanelExpanded ? 0.8 : 0.0)
            .animation(Animation.easeInOut.delay(0.5))
        }
        .padding(.trailing)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .shadow(radius: 8)
        )
        .animation(.easeInOut)
        .onTapGesture {
            isInfoPanelExpanded.toggle()
        }
    }
}


// MARK: - Private Helpers
private extension ParentChild_Animation_Sequencing_ProblemExampleView {
}


#if DEBUG
// MARK: - Preview
struct ParentChild_Animation_Sequencing_ProblemExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ParentChild_Animation_Sequencing_ProblemExampleView()
        }
    }
}
#endif
