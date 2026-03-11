//
//  Loan Shark Data.swift
//  The Cliker
//
//  Created by Desire on 2026-03-11.
//


import Foundation
import Combine

class LoanSharkData: ObservableObject {
    
    @Published var numOfLoanSharks: Int = 0
    @Published var typeOfLoanSharks: [AllBuildingsBlueprint] = []
    
    
}
