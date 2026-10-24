//
//  Nofications View.swift
//  The Cliker
//
//  Created by Desire on 2026-04-23.
//

import SwiftUI

struct NofiticationsView: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @State private var geo: GeometryProxy
    
    var body: some View {
        
        
        //MARK: NOTIFICATIONS
        //make this a list where notifications are kept in an array so notificatiosn drop down like how it does on apple
        switch gameState.importantInfo {
        case .nothing:
            #if os(macOS)
            
            #endif
        case .worldNotLoaded:
            Text("The world loaded wasn't found")
                .foregroundColor(.black)
                .padding(2)
                .background(.yellow)
                .cornerRadius(5)
                .textSelection(.enabled)
                .position(x:geo.size.width/2, y:geo.size.height * 0.1)
        case .worldDeleted:
            Text("The world was Deleted")
                .foregroundColor(.black)
                .padding(2)
                .background(.yellow)
                .cornerRadius(5)
                .textSelection(.enabled)
                .position(x:geo.size.width/2, y:geo.size.height * 0.1)
        case .worldCreated:
            Text("The world was created")
                .foregroundColor(.black)
                .padding(2)
                .background(.yellow)
                .cornerRadius(5)
                .textSelection(.enabled)
                .position(x:geo.size.width/2, y:geo.size.height * 0.1)
        }
        
        
        
        
        
    }
    
    
    
    init(geo: GeometryProxy) {
        
        self.geo = geo
    }
    
}
