//
//  Click Mechanics.swift
//  The Cliker
//
//  Created by Desire on 2026-03-07.
//

import Foundation
import Combine
import SwiftUI


class allGameMechanics: ObservableObject {
    
    
    ///Per Second
    func updateTotalClicks() {
        
        @EnvironmentObject var gameState: GeneralGameData
        
        var totalClickIncrease: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {
            
            switch building {
                
            case .Clickers:
                totalClickIncrease = gameState.allBuildingAttribites[.Clickers]?.Increase ?? 15
 
            }
        }
        
        
        //increase the total clicks by the total click increase
        gameState.totalClicks += totalClickIncrease
    }
    
    func updateCosts() {
        
        
        
    }
    
    
}
