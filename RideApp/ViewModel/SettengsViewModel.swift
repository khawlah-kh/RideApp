//
//  SettengsViewModel.swift
//  RideApp
//
//  Created by khawlah khalid on 16/03/2022.
//

import SwiftUI


final class SettengsViewModel : ObservableObject{
    
    @Published var travelRadius : Double = 300
    @AppStorage("travelRadius") var storedTravelRadius: Double = 300

    
    init(){
       travelRadius = storedTravelRadius
        print(storedTravelRadius,"💙")
        
    }
    
}
