//
//  SavedRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SavedRecipeView: View {
    var body: some View {
        NavigationView {
            EmptySavedRecipesStateView()
                .navigationBarTitle("Saved Recipes 🧾")
        }
    }
}

struct SavedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipeView()
    }
}

//MARK:- EmptySavedRecipesStateView
struct EmptySavedRecipesStateView:View {
    var body: some View{
        ZStack{
            VStack(spacing:10){
                Image("Card5")
                    .resizable()
                    .frame(width: 250 , height: 250)
                Text("You Do Not Have Saved Recipes Currently Go And Pick Some!")
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .padding()
            }
        }
        .offset(y:-30)
    }
}
