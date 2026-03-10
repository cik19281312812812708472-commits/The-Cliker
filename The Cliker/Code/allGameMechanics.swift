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
    
   var gameState: GeneralGameData
    
    init(gameState: GeneralGameData) {
        self.gameState = gameState
    }
    
    
    func updateEverything() {
        
        updateTotalClicks()
        
    }
    
    
    
    
    
    
    
    ///Per Second
    func updateTotalClicks() {
        
        var totalClickIncrease: Decimal = 0

        for (building, buildingAttributes) in gameState.allBuildingAttribites {
            
            switch building {
                
            case .Clickers:
                totalClickIncrease = gameState.allBuildingAttribites[.Clickers]?.Increase ?? 15
                
                
 
            case .Freelancers:
                totalClickIncrease = gameState.allBuildingAttribites[.Clickers]?.Increase ?? 150
            }
        }
        
        
        //increase the total clicks by the total click increase
        gameState.totalClicks += totalClickIncrease
    }
    
    
    ///This just finds the building. It's helper func does the actual setting it is called
    ///```swift
    ///
    ///print("")
    ///```
    func updateCosts() {
        
        
        ///defining the cost stuff
        ///
        ///
        func setCosts(whatBuilding: AllBuildingsBlueprint) {
            
            var amountOfBuildings: Int = Int(gameState.allBuildingAttribites[whatBuilding]?.amount ?? 1)
            
            var costMultiplier: Decimal = gameState.allBuildingAttribites[whatBuilding]?.costMultiplier ?? 1.1
            
            var oldCost: Decimal = gameState.allBuildingAttribites[whatBuilding]?.Cost ?? 15
            var newCost: Decimal = oldCost * Decimal(amountOfBuildings) * costMultiplier
       
       //setting hte new cost
            gameState.allBuildingAttribites[whatBuilding]?.Cost = newCost
            
            
        }//setting the costs end
        
        //looking through the all the buildings
        for (building, buildingAttributes) in gameState.allBuildingAttribites {
                setCosts(whatBuilding: building)
        }

        
    }// func update costs end
    
    
    //MARK: nonupdating funcs
    
    ///no nupdatin
    func findNumOfBuildings() -> Int {
        
        let numOfBuildings = gameState.allBuildingAttribites.count
        
        return numOfBuildings
    }
    
    // a view is needed to be returned
    
    ///non updating
    func createBuildingButton(whatBuilding: AllBuildingsBlueprint) -> some View {
        
        Button {
           
            switch whatBuilding {
                
            case .Clickers:
                self.gameState.allBuildingAttribites[.Clickers]?.amount += 1
                
            case .Freelancers:
                self.gameState.allBuildingAttribites[.Freelancers]?.amount += 1
                
            }
            
            
        } label: {
            
            switch whatBuilding {
            case .Clickers:
                Text("Buy a Clicker")
            case .Freelancers:
                Text("Buy a Freelancer")
            }

        }//label end
        
    }
    
    
}
