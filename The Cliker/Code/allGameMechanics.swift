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
        
        
        loanSharkMechanics.allLoanSharkMechanics()
        updateTotalClicks()
        print("\(gameState.allBuildingAttribites)")
    }
    
    
    ///Per Second
    func updateTotalClicks() {
        
        var totalClickIncrease: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {

            totalClickIncrease += (buildingAttributes.Increase * Decimal(buildingAttributes.amount) * buildingAttributes.IncreaseMultiplier)
 
        }
        
        
        //increase the total clicks by the total click increase
        gameState.currentClicks += totalClickIncrease
        gameState.deltaClicks = totalClickIncrease
       
    }
    
    func setCost(whatBuilding: AllBuildingsBlueprint) {
        
        
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
                setCost(whatBuilding: building)
        }

        
    }// func update costs end
    
    
    //MARK: nonupdating funcs
    
    ///no nupdatin
    func findNumOfBuildings() -> Int {
        
        let numOfBuildings = gameState.allBuildingAttribites.count
        
        return numOfBuildings
    }
    
    // a view is needed to be returned
    
    func subtractClicks(whatBuilding: AllBuildingsBlueprint) {
        
        self.gameState.allBuildingAttribites[whatBuilding]?.amount += 1
        
        if let cost = self.gameState.allBuildingAttribites[whatBuilding]?.Cost {
            self.gameState.currentClicks -= cost
        }
        self.setCost(whatBuilding: whatBuilding)
    }
    
    ///non updating
    func createBuildingButton(whatBuilding: AllBuildingsBlueprint) -> some View {
        
        Button {
                self.subtractClicks(whatBuilding: whatBuilding)
        } label: {
            
            let Cost = (self.gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 0)
            
            switch whatBuilding {
                
            case .Clickers:
                
                HStack {
                    
                    Image("Cursor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                     
                    
                Text("$\(Cost) Buy a Cliker. ")
                        .padding()
                
            }
                
            case .Freelancers:
                
                HStack {
                    Image("Freelancer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("$\(Cost) Buy a Freelancer.")
                        .padding()
                }
            case .softwareDev:
                HStack {
                    Image("Freelancer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("$\(Cost) Buy a Software Developer.")
                        .padding()
                }
            }

        }//label end
        .padding()
        
    }
    
    
}
