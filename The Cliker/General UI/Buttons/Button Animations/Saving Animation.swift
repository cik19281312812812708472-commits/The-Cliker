//
//  Loading and Saving Button Animatino.swift
//  The Cliker
//
//  Created by Desire on 2026-04-24.
//

import SwiftUI



///Please remove any .background in text for this to work
struct SavingAnimation: ButtonStyle {
    
    var pressedColor: Color = .green
    var unPressedColor: Color = .blue
    var duration: Double = 0.2
    var isActive: Bool = false
    
    
    ///This is the minimun scale when pressed
    var minimumScale: CGFloat = 1.2
  
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(isActive ? pressedColor : unPressedColor)
            .cornerRadius(10)
            .scaleEffect(isActive ? minimumScale : 1.0)
            .animation(.easeIn(duration: duration), value: isActive)
            

    }
    
    
    init(activateAnimation: Bool = false, pressedColor: Color, unPressedColor: Color, duration: Double, minimumScale: CGFloat = 0.8) {
        self.isActive = activateAnimation
        self.pressedColor = pressedColor
        self.unPressedColor = unPressedColor
        self.duration = duration
        self.minimumScale = minimumScale
      
    }
    
}
