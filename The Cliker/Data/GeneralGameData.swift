//
//  GameData.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//MARK: - My Heading

import Foundation
import Combine


class GeneralGameData: ObservableObject {
   
    @Published var totalClicks: Int = 0
    @Published var totalUpgrades: AllUpgradesBlueprint = AllUpgradesBlueprint(allBuildings: [.numOfClickers: 0])
    
    
    //MARK: all the increases 
    @Published var clickerIncrease: Int = 1
        
    
    
    
    enum AllBuildingsBlueprint_blueprint {
        
        case numOfClickers
        
        
    }
    
    //for expansion
    struct AllUpgradesBlueprint {
        
        var allBuildings: [AllBuildingsBlueprint_blueprint:Int] = [:]
        
        init(allBuildings: [AllBuildingsBlueprint_blueprint:Int]) {
            self.allBuildings = allBuildings
        }
        
    }
    
    
    
    
    
    
}
