//
//  LoanShark Mechanics.swift
//  The Cliker
//
//  
//

import Foundation
import Combine
import SwiftUI

class LoanSharkMechanics: ObservableObject {
    
    var gameState: GeneralGameData
    var loanSharkState: LoanSharkData
    
     init(gameState: GeneralGameData, loanSharkState: LoanSharkData) {
         self.gameState = gameState
         self.loanSharkState = loanSharkState
     }
    
    
    func allLoanSharkMechanics() {
        
        scanForDebt()
    }
    
    func scanForDebt() {
        print("gameState.currentClicks = \(gameState.currentClicks)")
        
        let ratio = abs(gameState.currentClicks / gameState.deltaClicks)
        
        if ratio > 2 && gameState.currentClicks < 0  {
            getLoanSharks()
            findNumOfLoanSharks()
            seizeAssets()
        }
        
        resetLoanSharks()
        
    }
    
    func resetLoanSharks() {
        loanSharkState.typeOfLoanSharks = []
    }
    
    func seizeAssets() {
        
        var highestIncrease: Decimal = 0
        var buildingToDelete: AllBuildingsBlueprint = .clickers //here for init and it will be changed later
        
        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            let buildingIncrease = buildingAttributes.Increase * buildingAttributes.IncreaseMultiplier
            let amountOfBuildings = buildingAttributes.amount
            if buildingIncrease > highestIncrease && amountOfBuildings > 0 {
                highestIncrease = buildingIncrease
                buildingToDelete = building
            }
        }
        
        gameState.allBuildingAttribites[buildingToDelete]?.amount -= loanSharkState.numOfLoanSharks
    print("there are \(loanSharkState.numOfLoanSharks) Loansharks ")
    }
    
    func getLoanSharks() {
        
        
        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            var containsBuilding = false
            
            if loanSharkState.typeOfLoanSharks.contains(building) {
                containsBuilding = true
            }
            
            if buildingAttributes.amount > 0 && containsBuilding == false {
                
                loanSharkState.typeOfLoanSharks.append(building)
                
            }
        }
        
    }
    
    func findNumOfLoanSharks() {
        
        loanSharkState.numOfLoanSharks = loanSharkState.typeOfLoanSharks.count
        
    }
    
    
}
