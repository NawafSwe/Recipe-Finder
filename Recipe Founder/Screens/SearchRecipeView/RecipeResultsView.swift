//
//  RecipeResultsView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

struct RecipeResultsView: View {
    var body: some View {
        NavigationView{
            List{
                RecipeView()
                RecipeView()
                RecipeView()
            }
            .navigationBarTitle("Recipes Result 🧾☕️")
        }
    }
}
struct RecipeResultsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeResultsView()
    }
}
//MARK:- RecipeView
struct RecipeView:View{
//    let title:String = ""
//    let imageUrl:String = ""
    
    var body: some View{
        HStack(spacing:10){
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100)
                .cornerRadius(10)
            Text("Chicken Fresh")
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}
