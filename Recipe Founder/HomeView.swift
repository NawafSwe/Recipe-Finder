//
//  HomeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            Text(" This isHome View")
            
                .navigationBarTitle("Home View😄")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
