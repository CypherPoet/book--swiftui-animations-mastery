//
// ParentChild_Animation_Sequencing_Solution2View.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/3/21.
// ✌️
//

import SwiftUI


struct ParentChild_Animation_Sequencing_Solution2View {
    @State private var isInfoPanelExpanded = false
    @State private var isPanelContentVisible = false
}



// MARK: - `View` Body
extension ParentChild_Animation_Sequencing_Solution2View: View {
    
    var body: some View {
        VStack(spacing: 18.0) {
            Text("Sequencing Parent and Child Views")
                .screenBanner(backgroundColor: .accentColor)

            VStack {
                Text("Solution 2")
                    .font(.title2)
                
                Text("Using Transitions")
                    .font(.subheadline)
            }
            
            ScreenSectionDivider()
            
            VStack(spacing: 18.0) {
                Text("""
                Sometimes, withAnimation is the only solution when you want to \
                animate a child view independently of a parent view.
                """
                )
                
                ScreenSectionDivider()
                
                Text("""
                What we want is for the view to slide up, and THEN have the child views appear.
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
extension ParentChild_Animation_Sequencing_Solution2View {
    
    func panelOffset(in geometry: GeometryProxy) -> CGSize {
        let frame = geometry.frame(in: .global)
        
        return .init(
            width: isInfoPanelExpanded ? 15 : frame.width - 60,
            height: isInfoPanelExpanded ? 15 : frame.height - 60
        )
    }
}


// MARK: - View Content Builders
private extension ParentChild_Animation_Sequencing_Solution2View {
    
    
    var infoPanel: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: "info.circle")
                Text("Login Help")
                Spacer()
            }
            .font(.title)
            .padding()
            
            if isInfoPanelExpanded {
                infoPanelContent
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.11))
                    .padding(.horizontal)
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.opacity.animation(Animation.easeInOut.delay(0.5)),
                            removal: AnyTransition.identity.animation(.easeInOut)
                        )
                    )
            }
            
            Color.clear
        }
        .frame(maxWidth: .infinity)
        .padding(.trailing)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .shadow(radius: 8)
        )
        .onTapGesture {
            withAnimation(Animation.easeInOut) {
                isInfoPanelExpanded.toggle()
            }
        }
    }
    
    
    var infoPanelContent: some View {
        VStack(spacing: 10) {
            Image(systemName: "slider.horizontal.3").font(.largeTitle)
            Text("Much better 😻")
        }
    }
}


// MARK: - Private Helpers
private extension ParentChild_Animation_Sequencing_Solution2View {
}


#if DEBUG
// MARK: - Preview
struct ParentChild_Animation_Sequencing_Solution2View_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ParentChild_Animation_Sequencing_Solution2View()
        }
    }
}
#endif
