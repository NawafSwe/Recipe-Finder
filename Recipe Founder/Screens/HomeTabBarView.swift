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
                    Icons.SFHouse
                    Text("Home")
                }
            SavedRecipeView()
                .tabItem {
                    Icons.SFLeaf
                        .renderingMode(.original)
                    Text("Saved Recipes")
                    
                }
            SettingView()
                .tabItem {
                    Icons.SFSettings
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
