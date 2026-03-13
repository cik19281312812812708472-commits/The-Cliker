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
    
    
    var loanSharkMechanics: LoanSharkMechanics
    
    var gameState: GeneralGameData
    
    init(gameState: GeneralGameData, loanSharkMechanics: LoanSharkMechanics) {
        self.gameState = gameState
        self.loanSharkMechanics = loanSharkMechanics
    }
    
    
    func updateEverything() {
        
        jobPayments()
        updateInceaseMultiplier()
        loanSharkMechanics.allLoanSharkMechanics()
        updateTotalClicks()
        print("\(gameState.allBuildingAttribites)")
    }
    
    func updateInceaseMultiplier() {
        
        //employees have a boost per employee
        gameState.allBuildingAttribites[.employees]?.IncreaseMultiplier = Decimal(gameState.allBuildingAttribites[.employees]?.amount ?? 0)  * 0.5 + 1
        
        gameState.allBuildingAttribites[.softwareDev]?.IncreaseMultiplier = Decimal(gameState.allBuildingAttribites[.softwareDev]?.amount ?? 0)  * 0.1 + 1
        
        //manageres increase employee multiplyer by +200%
        gameState.allBuildingAttribites[.employees]?.IncreaseMultiplier += Decimal(gameState.allBuildingAttribites[.manager]?.amount ?? 0) * 2 * Decimal(gameState.allBuildingAttribites[.employees]?.amount ?? 0) * Decimal(gameState.allBuildingAttribites[.manager]?.amount ?? 0)
        
        //and they increase software dev miltiplier
        gameState.allBuildingAttribites[.softwareDev]?.IncreaseMultiplier += Decimal(gameState.allBuildingAttribites[.manager]?.amount ?? 0) * 2 * Decimal(gameState.allBuildingAttribites[.softwareDev]?.amount ?? 0) * Decimal(gameState.allBuildingAttribites[.manager]?.amount ?? 0)
        
    }
    
    
    func jobPayments() {
        
        var totalPayments: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            totalPayments += (buildingAttributes.rent * Decimal(buildingAttributes.amount))
 
        }
        
        
        //increase the total clicks by the total click increase
        gameState.currentClicks -= totalPayments
        gameState.deltaClicks -= totalPayments
        
    }
    
    
    ///Per Second
    func updateTotalClicks() {
        
        var totalClickIncrease: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            totalClickIncrease += (buildingAttributes.Increase * Decimal(buildingAttributes.amount) * buildingAttributes.IncreaseMultiplier)
 
        }
        
        
        totalClickIncrease *= ((gameState.allUpgrades[.Efficiency]?.level ?? 0) + 1)
        print(gameState.allUpgrades[.Efficiency]?.level)
        
        //increase the total clicks by the total click increase
        gameState.currentClicks += totalClickIncrease
        gameState.deltaClicks = totalClickIncrease
       
    }
    
    func setCost(whatBuilding: AllBuildingsBlueprint, UpgradeOrBuilding: Bool, whatUpgrade: AllUpgrades_Blueprint) {
        
        
        if UpgradeOrBuilding == false {
            var amountOfBuildings: Int = Int(gameState.allBuildingAttribites[whatBuilding]?.amount ?? 1)
            
            if amountOfBuildings > 0 {
                
                var costMultiplier: Decimal = gameState.allBuildingAttribites[whatBuilding]?.costMultiplier ?? 1.1
                
                var oldCost: Decimal = gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 15
                
                var costValue = (oldCost * costMultiplier)
                
                
                
                var newCost = Decimal()
                
                NSDecimalRound(&newCost, &costValue, Int(gameState.roundLevel), .plain)
                
                
                
                //setting hte new cost
                gameState.allBuildingAttribites[whatBuilding]?.Cost = newCost
            }
        } else {
            
            var upgradeLevel: Decimal = gameState.allUpgrades[whatUpgrade]?.level ?? 0
            
            if upgradeLevel > 0 {
                
                var costMultiplier: Decimal = gameState.allUpgrades[whatUpgrade]?.costMultiplier ?? 1.1
                
                var oldCost: Decimal = gameState.allUpgrades[whatUpgrade]?.Cost ?? 15
                
                var costValue = (oldCost * costMultiplier)
                
                
                
                var newCost = Decimal()
                
                NSDecimalRound(&newCost, &costValue, Int(gameState.roundLevel), .plain)
                
                
                
                //setting hte new cost
                gameState.allUpgrades[whatUpgrade]?.Cost = newCost
            }
            
        }
        
        
    }//setting the costs end
    
    ///This just finds the building. It's helper func does the actual setting it is called
    ///```swift
    ///
    ///print("")
    ///```
    func updateCosts(whatBuilding: AllBuildingsBlueprint) {
        
        
        ///defining the cost stuff
        ///
        ///
        
        
        //looking through the all the buildings
        for (building, buildingAttributes) in gameState.allBuildingAttribites {
            setCost(whatBuilding: building, UpgradeOrBuilding: false, whatUpgrade: .Efficiency)
        }

        
    }// func update costs end
    
    
    //MARK: nonupdating funcs
    
    ///no nupdatin
    func findNumOfBuildings() -> Int {
        
        let numOfBuildings = gameState.allBuildingAttribites.count
        
        return numOfBuildings
    }
    
    // a view is needed to be returned
    
    ///Use .Efficiency for nil and .Clicker for nil
    func subtractClicks(whatBuilding: AllBuildingsBlueprint, UpgradeOrBuilding: Bool, whatUpgrade: AllUpgrades_Blueprint) {
        
        
        if UpgradeOrBuilding == false {
            
            self.gameState.allBuildingAttribites[whatBuilding]?.amount += 1
            
            if let cost = self.gameState.allBuildingAttribites[whatBuilding]?.Cost {
                self.gameState.currentClicks -= cost
            }
            self.setCost(whatBuilding: whatBuilding, UpgradeOrBuilding: false, whatUpgrade: .Efficiency)
            
        } else {
            
            self.gameState.allUpgrades[whatUpgrade]?.level += 1
            
            if let cost = self.gameState.allUpgrades[whatUpgrade]?.Cost {
                self.gameState.currentClicks -= cost
            }
            
            //the .Clikers is a "nil" value
            self.setCost(whatBuilding: .clickers, UpgradeOrBuilding: true, whatUpgrade: whatUpgrade)
        }
        
        
        
    }
    
}
