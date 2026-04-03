//
//  Click Mechanics.swift
//  The Cliker
//
//  
//

import Foundation
import Combine
import SwiftUI


class allGameMechanics: ObservableObject {
    
    //MARK: add rounding upgrade
    var loanSharkMechanics: LoanSharkMechanics

    var gameState: GeneralGameData
    var soundManager: SoundManager
    
    init(gameState: GeneralGameData, loanSharkMechanics: LoanSharkMechanics, soundManager: SoundManager) {
        self.gameState = gameState
        self.loanSharkMechanics = loanSharkMechanics
        self.soundManager = soundManager
    }
    
    
    func updateEverything() {
        //print("Uranium mine cost: \(gameState.allBuildingAttribites[.uraniumMill])")
       // gameState.currentClicks *= 9000000000000000
        gameState.importantInfo = .nothing
        jobPayments()
        updateInceaseMultiplier()
        loanSharkMechanics.allLoanSharkMechanics()
        updateTotalClicks()
        employ()
        
        
        addClickBoost()
      
        
        print("gameState.worldssave = ", gameState.worldsSaved)
        
        if gameState.autoSaving == true && gameState.gameCondition == .playingGame {
            gameState.deleteData(worldName: gameState.currentWorld)
            gameState.saveData(worldName: gameState.currentWorld)
        }
        //print("\(gameState.allBuildingAttribites)")
    }
    
    func addClickBoost() {
        
        let tempClickRate = gameState.clickRate
        if tempClickRate != 15 {
            let boostAmount = gameState.deltaClicks * pow(1.1, Int("\(tempClickRate)") ?? 0)
            //fix the recruter
            print("Boost ammount: \(boostAmount)")
            gameState.deltaClicks += boostAmount
            gameState.currentClicks += boostAmount
            gameState.clickRate -= tempClickRate
        }
        
    }
    func updateInceaseMultiplier() {
        
        //employees have a boost per employee
        gameState.allBuildingAttribites[.employees]?.IncreaseMultiplier = Decimal(gameState.allBuildingAttribites[.employees]?.amount ?? 0)  * 0.5 + 1
        
        gameState.allBuildingAttribites[.softwareDev]?.IncreaseMultiplier = Decimal(gameState.allBuildingAttribites[.softwareDev]?.amount ?? 0)  * 0.1 + 1
        
        var numOfEmployees: Decimal = 0
        for (buildingCase, building) in gameState.allBuildingAttribites {
     
            if building.buildingType.contains(.employee) {
                numOfEmployees += Decimal(building.amount)
                for (managerCase, manager) in gameState.allBuildingAttribites {
                    
                    if manager.buildingType.contains(.manager) {
                        gameState.allBuildingAttribites[buildingCase]?.IncreaseMultiplier += Decimal(manager.amount) * 2 *  Decimal(building.amount) * Decimal(manager.amount)
                    }
                    
                }
            }
        }
         
        
     
        var numOfEmployeesNeeded: Decimal = 0
        
        for (buildingCase, building) in gameState.allBuildingAttribites {
            
            if building.buildingType.contains(.building) {
                numOfEmployeesNeeded += Decimal(building.amount) * building.rent
            }
            
        }
        
         
        
        
        for (buildingCase, building) in gameState.allBuildingAttribites {
            
            if building.buildingType.contains(.building) {
                
              gameState.allBuildingAttribites[buildingCase]?.IncreaseMultiplier = (numOfEmployees * 10) / (numOfEmployeesNeeded + 1)
                //print("Increase multipler \(gameState.allBuildingAttribites[buildingCase]?.IncreaseMultiplier), num of employees: \(numOfEmployees), num of employees needed: \(numOfEmployeesNeeded), btw it is not + 1")
            }
        }
        
      
    }
    
    func click() {
        
        let clickLevel: Decimal = gameState.allUpgrades[.clicking]?.level ?? 0
        
        var clickIncrease: Decimal = 0
        if clickLevel >= Decimal(1) {
            clickIncrease += 1 + (clickLevel * 0.1 * gameState.deltaClicks)//10%
        } else {
            clickIncrease += 1
        }
        
        gameState.currentClicks += clickIncrease
        gameState.deltaClicks += clickIncrease
        gameState.clickRate += 1
        soundManager.clickingSound()
        
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
    
    
    func employ() {
        
        guard let employTarget = gameState.allUpgrades[.employeers]?.buildingRecruiting else { return }
        let level = gameState.allUpgrades[.employeers]?.level ?? 0
        
        if level >= 1 {
            
            if let target = gameState.allBuildingAttribites[employTarget] {
                if gameState.currentClicks >=  target.Cost * 1000 {
                    gameState.allBuildingAttribites[employTarget]?.amount += NSDecimalNumber(decimal: level).intValue
                    gameState.currentClicks -= target.Cost
                    setCost(whatBuilding: employTarget, UpgradeOrBuilding: false, whatUpgrade: .employeers)
                    gameState.allUpgrades[.Efficiency]?.Cost += 1
                }
            }
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ///Per Second
    func updateTotalClicks() {
        
        var totalClickIncrease: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            totalClickIncrease += (buildingAttributes.Increase * Decimal(buildingAttributes.amount) * buildingAttributes.IncreaseMultiplier)
 
        }
        
        //30%
        totalClickIncrease *= pow(1.3, Int("\((gameState.allUpgrades[.Efficiency]?.level ?? 0) + 1)") ?? 0 )
       // print(gameState.allUpgrades[.Efficiency]?.level)
        
        
        let investorUpgrade = gameState.allUpgrades[.investors]
        let investorLevel = NSDecimalNumber(decimal: investorUpgrade?.level ?? 0).doubleValue
        totalClickIncrease += gameState.currentClicks/100 * (Decimal(Double.random(in: (investorLevel/2)...(investorLevel * 10)))/100000000 + 1)
        
        print("Invested and gained: \( gameState.currentClicks/100 * (Decimal(Double.random(in: (investorLevel/2)...(investorLevel * 10)))/100000000 + 1))") 
        
        
        
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
