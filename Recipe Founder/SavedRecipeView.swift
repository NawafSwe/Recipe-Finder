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
            Text("Saved Recipe View")
                .navigationBarTitle("Saved Recipes 🧾")
        }
    }
}

struct SavedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipeView()
    }
}
