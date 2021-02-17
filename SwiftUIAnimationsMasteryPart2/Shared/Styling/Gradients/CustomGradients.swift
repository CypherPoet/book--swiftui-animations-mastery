//
// CustomGradients.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/9/21.
// ✌️
//

import SwiftUI

enum CustomGradients {
    

    
//    static let screenBackground1 = RadialGradient(
//        gradient: Gradient(
//            stops: [
//                Gradient.Stop(color: Color("BackgroundGradient1-1"), location: 0.0),
////                Gradient.Stop(color: Color("BackgroundGradient1-1"), location: 0.3),
//                Gradient.Stop(color: Color("BackgroundGradient1-2"), location: 1.0),
//            ]
//        ),
//        center: .center,
//        startRadius: 0,
//        endRadius: 2000
//    )
    
    static let screenBackground1 = RadialGradient(
        gradient: Gradient.Custom.screenBackground1,
        center: .center,
        startRadius: 0,
        endRadius: 2000
    )
}


extension Gradient {
    
    enum Custom {
        static let screenBackground1 = Gradient(
            stops: [
                Gradient.Stop(color: Color("BackgroundGradient1-1"), location: 0.0),
                Gradient.Stop(color: Color("BackgroundGradient1-2"), location: 1.0),
            ]
        )
    }
}
