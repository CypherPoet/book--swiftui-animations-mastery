//
//  Exercise_Spring_Final.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/7/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_Spring_Final: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Image("Planet")
                    .padding(.vertical, 80)
                    .offset(x: start ? 0 : 400)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3))
                
                Text("PLANET EXPLORER")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))
                    .offset(x: start ? 0 : -400)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3))
                
                VStack {
                    Text("START")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10)
                            .delay(0.9))
                    
                    Text("EXPLORING!")
                        .font(.title)
                        .foregroundColor(Color("LightAccent2"))
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5)
                            .delay(1.3))
                }
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .accentColor(Color("LightShade2"))
                        .padding(25)
                        .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                        .opacity(start ? 1 : 0)
                        .animation(Animation.linear(duration: 1.6).delay(0.3))
                }
            }.onAppear { self.start.toggle() }
        }
    }
}

struct Exercise_Spring_Final_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Spring_Final()
    }
}
