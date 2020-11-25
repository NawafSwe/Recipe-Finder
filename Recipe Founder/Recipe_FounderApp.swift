//
//  Recipe_FounderApp.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

@main
struct Recipe_FounderApp: App {
    /// using the core data model across all the app
    let context = DataStore.shared.context
    var body: some Scene {
        WindowGroup {
            ///Here I'm creating a context variable from the persistent container in our DataStore singleton, and adding as an environment variable to our ContentView. Jumping into our ContentView we have the following:
            HomeTabBarView()
                .environment(\.managedObjectContext, context)
              
        }
    }
}
