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
                RecipeCellView()
                RecipeCellView()
                RecipeCellView()
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
