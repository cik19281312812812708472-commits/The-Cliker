//
//  Scroll Bar.swift
//  The Cliker
//
//  Created by Desire on 2026-04-23.
//

import SwiftUI


struct ClickingView_SettingsScrollBar: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @EnvironmentObject var appData: AppData
    @State private var geo: GeometryProxy
    
    var body: some View {
        
        ScrollView {
            Text("Settings")
                .font(.system(size: 20))
                .fontWeight(.black)
            
            Divider()
            
            
            Button {
                gameState.lastView = gameState.gameCondition
                gameState.gameCondition = .guide
                
            } label: {
                Text("Game Guide")
                   
                    .padding(2)
                    //.background(.gray)
                    .cornerRadius(5)
                    .textSelection(.enabled)
            }
            
            
            Button {
                gameState.lastView = gameState.gameCondition
                gameState.gameCondition = .savingData
                
            } label: {
                Text("Save Game")
                   
                    .padding(2)
                    //.background(.gray)
                    .cornerRadius(5)
                    .textSelection(.enabled)
            }
            
            Divider()
            Toggle("Auto Save", isOn: $gameState.autoSaving)
                .contextMenu {
                    Text("This will auto save your game every second. If you are playing.")
                }
                .toggleStyle(.checkbox)
          
           
            
            Divider()
            VStack {
                
                Text("Volume")
                    .bold()
                Slider(value: $appData.appVolume, in: 0...1)
                    .frame(width: geo.size.width * 0.1)
                    
            }
            Divider()
            
            
            
            
            Button {
                gameState.lastView = gameState.gameCondition
                gameState.gameCondition = .loadingData
                
            } label: {
                Text("Load a World")
                    
                    .padding(2)
                    //.background(.gray)
                    .cornerRadius(5)
                    .textSelection(.enabled)
            }
            
            Button {
                gameState.lastView = gameState.gameCondition
                gameState.gameCondition = .creatingWorld
            } label: {
                Text("Create a World")
                   
                    .padding(2)
                    //.background(.gray)
                    .cornerRadius(5)
                    .textSelection(.enabled)
            }
            
            Button {
                gameState.lastView = gameState.gameCondition
                gameState.gameCondition = .deletingData
            } label: {
                Text("Delete a World")
                
                    .padding(2)
                    //.background(.gray)
                    .cornerRadius(5)
                    .textSelection(.enabled)
            }
            
            
                
            
        }
    
    }
    
    init(geo: GeometryProxy) {
        self.geo = geo
    }
    
}
