//
// WelcomeView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 11/26/20.
// ✌️
//

import SwiftUI


struct WelcomeView {
    
    @AppStorage("hasShownWelcomeScreen")
    private var hasShownWelcomeScreen: Bool = false
}


// MARK: - `View` Body
extension WelcomeView: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 24.0) {
                Text("Welcome 👋")
                    .font(.largeTitle)
                
                
                Text(
                    """
                    This project is "Part Two" of the examples I'm making to follow along with SwiftUI Animations Mastery.

                    The first project was made during the "1.0" period of SwiftUI, and covers the first few sections of the book.

                    This project picks up from there -- starting after SwiftUI 2.0 was released in late 2020.
                    """
                )
            }
            .padding(.horizontal, 24)
            .padding(.vertical)
            .frame(maxWidth: 400)
            
            Spacer()
            
            Button(
                action: {
                    hasShownWelcomeScreen.toggle()
                },
                label: {
                    Text("Table of Contents")
                        .foregroundColor(Color.accentColor)
                        .padding()
                        .background(
                            Capsule()
                                .strokeBorder(Color.accentColor, lineWidth: 2)
                        )
                }
            )
            
            Spacer()
            Spacer()
        }
    }
}


// MARK: - Computeds
extension WelcomeView {
}


// MARK: - View Variables
private extension WelcomeView {
}


// MARK: - Private Helpers
private extension WelcomeView {
}


#if DEBUG
// MARK: - Preview
struct WelcomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        WelcomeView()
    }
}
#endif
