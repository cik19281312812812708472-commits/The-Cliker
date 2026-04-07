//
//  Progress Bar.swift
//  The Cliker
//
//  Created by Desire on 2026-04-02.
//



import SwiftUI




struct ProgressBar_UIElement: View {
    
    
    var progress: Double = 0
    var height: Double = 10
    var width: Double = 10
    var color: Color = Color.green
    var allignment: Alignment = .leading
    
    var body: some View {
        
        
        GeometryReader { geo in
               
            ZStack(alignment: allignment) {
                
                if progress > 1 {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: geo.size.height * progress / progress)
                        .foregroundColor(color)
                        .animation(.easeInOut, value: progress / progress)
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: geo.size.height * progress)
                        .foregroundColor(color)
                        .animation(.easeInOut, value: progress)
                }
                
            }
            .cornerRadius(10)
        }
        .frame(width: width, height: height)
        
    }
    
  
    init(progress: Double, height: Double, width: Double, color: Color, allignment: Alignment? = .leading) {
        self.progress = progress
        self.height = height
        self.width = width
        self.color = color
        self.allignment = allignment ?? .leading
    }
    
    
    
}


