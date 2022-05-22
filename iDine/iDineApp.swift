//
//  ContentView.swift
//  iDine
//
//  Created by Геннадий Ведерников on 21.05.2022.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
