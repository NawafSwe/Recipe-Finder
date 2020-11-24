//
//  HomeTabBarView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct HomeTabBarView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            
            SavedRecipeView()
                .tabItem {
                    Image(systemName: "leaf")
                        .renderingMode(.original)
                    Text("Saved Recipes")
                    
                }
            
            SettingView()
                .tabItem {
                    Image(systemName:"gear")
                    Text("Setting")
                }
            
            
        }
        .tabViewStyle(DefaultTabViewStyle())
        .accentColor(.healthyColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBarView()
    }
}
