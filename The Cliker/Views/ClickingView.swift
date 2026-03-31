//
//  StarterView.swift
//  The Cliker
//
//  
//

import SwiftUI


struct ClickingView: View {
    
    @EnvironmentObject var gameState: GeneralGameData
    @EnvironmentObject var gameMechanics: allGameMechanics
    @EnvironmentObject var BuildingButtonClass: Buttons_Class
    @EnvironmentObject var UI_Functions: UI_Functions
    @EnvironmentObject var appData: AppData
    @EnvironmentObject var soundManager: SoundManager
    
    @State private var tick: Timer?
    
    @State private var fastTick: Timer?
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Text(gameState.currentWorld)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(5)
                    .background(.yellow.opacity(0.2))
                    .cornerRadius(5)
                    .textSelection(.enabled)
                    .position(x:geometry.size.width/2, y:geometry.size.height * 0.1)
                
                Text("v \(latestVersion.description)")
                    .font(.subheadline)
                    .position(x: geometry.size.width/2, y: geometry.size.height * 0.122)
                
                
                
                if gameState.deltaClicks > 0 {
                    Text("+\(UI_Functions.stateNumber(whatNumber: gameState.deltaClicks))")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.green)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                } else if gameState.deltaClicks < 0{
                    Text("\(UI_Functions.stateNumber(whatNumber: gameState.deltaClicks))")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.red)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                } else {
                    Text("\(UI_Functions.stateNumber(whatNumber: gameState.deltaClicks))")
                        .foregroundColor(.white)
                        .padding(2)
                        .background(.gray)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height/1.5)
                }
                
                    
                Text("Cliks: \(UI_Functions.stateNumber(whatNumber: gameState.currentClicks))")
                    .position(x:geometry.size.width/2, y:geometry.size.height/2.5)
                
                //the clickign button
                Button {
                    gameMechanics.click()
                } label: {
                    ZStack {
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.17)
                            .cornerRadius(20)
                        
                        Image("Clik!")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                    }
                }
                .buttonStyle(ShrinkingButton())
                .position(x:geometry.size.width/2, y:geometry.size.height/2)
               
                //MARK: NOTIFICATIONS
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
                        .position(x:geometry.size.width/2, y:geometry.size.height * 0.1)
                case .worldDeleted:
                    Text("The world was Deleted")
                        .foregroundColor(.black)
                        .padding(2)
                        .background(.yellow)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height * 0.1)
                case .worldCreated:
                    Text("The world was created")
                        .foregroundColor(.black)
                        .padding(2)
                        .background(.yellow)
                        .cornerRadius(5)
                        .textSelection(.enabled)
                        .position(x:geometry.size.width/2, y:geometry.size.height * 0.1)
                }
                
               
                
                //MARK: Settings
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
                            .frame(width: geometry.size.width * 0.1)
                            
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
                .frame(width: geometry.size.width * 0.1, height:  geometry.size.height * 0.1)
                .position(x:geometry.size.width/2, y:geometry.size.height * 0.9)
                
                VStack {
        
                    HStack {
                       
                        
                        ScrollView {
                        
                            VStack {
                            
                                Text("Upgrades:")
                                //let numOfBuildings = gameMechanics.findNumOfBuildings
                            
                                ForEach(Array(gameState.allUpgrades), id: \.key) { upgrades in
                                
                                    Buttons_Class.UI_UpgradeButton(whatUpgrade: upgrades.key)
                                        .textSelection(.enabled)
                                }
                            
                            }
                            .padding()
                        
                        }
                        .frame(width: geometry.size.height * 0.3, height: geometry.size.height * 0.99)// wrapps the scroll view
                        .background(.blue.opacity(0.2))// wraps the frame
                        .cornerRadius(100)//wraps the background
                        .offset(x: geometry.size.width * -0.1, y: 0)
                    
                        
                    
                        
                    
                        //all the builds in a scroll view
                   
                            ScrollView {
                            
                                VStack {
                                
                                    Text("Assets:")
                                    //let numOfBuildings = gameMechanics.findNumOfBuildings
                                
                                    ForEach(Array(gameState.allBuildingAttribites), id: \.key) { building in
                                    
                                        Buttons_Class.UI_BuildingButton(whatBuilding: building.key)
                                    
                                    }
                                
                                }
                                .padding()
                            
                            }
                            .scrollIndicators(.hidden)
                            .frame(width: geometry.size.height * 0.5, height: geometry.size.height * 0.99)// wrapps the scroll view
                            .background(.blue.opacity(0.2))// wraps the frame
                            .cornerRadius(100)//wraps the background
                            .offset(x: geometry.size.width * 0.25, y: 0)
                            
                        
                    }//HStack end
                    
                    
                    
                    
                    
                }
            }
            
        } .onAppear() {
            
            tick = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in 
                gameMechanics.updateEverything()
            }
            
            fastTick = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in
                soundManager.updateVolume()
            }
            
            if gameState.loadingWorld == true {
                gameState.loadData(worldName: gameState.worldBeingLoaded)
                gameState.loadingWorld = false
            }
        }
        
        
    }
    
    
   
}


struct ShrinkingButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.5 : 1.0)
            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: configuration.isPressed)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
    
    
    
}

