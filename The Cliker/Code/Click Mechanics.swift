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
        
        var amount: Int = 0

        for (building, Amount) in gameState.totalUpgrades.allBuildings {
            
            switch building {
                
            case .numOfClickers:
                amount += gameState.clickerIncrease * Amount
 
            }
        }

        gameState.totalClicks += amount
    }
    
    
    
    
}
