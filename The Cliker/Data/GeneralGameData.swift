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
    @Published var totalUpgrades: AllUpgradesBlueprint = AllUpgradesBlueprint(numOfExtraClickers: 0)
 
    
    struct AllUpgradesBlueprint {
        
        var numOfExtraClickers: Int = 0
        init(numOfExtraClickers: Int) {
            self.numOfExtraClickers = numOfExtraClickers
        }
        
    }
    
    
    
    
    
    
}
