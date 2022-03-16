//
//  RideAppApp.swift
//  RideApp
//
//  Created by khawlah khalid on 14/03/2022.
//

import SwiftUI

@main
struct RideAppApp: App {
    @State var settingViewModel = SettengsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settingViewModel)
        }
    }
}
