//
//  RecipeDetailsViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import SwiftUI

final class RecipeDetailsViewModel:ObservableObject{
    
    @Published var showSafari = false
    @Published var alertItem:AlertItem? = nil
    private var core : DataStore = DataStore.shared

    var shared = DataStore.shared
    func saveRecipe(recipe: RecipeModel?){
        guard let safeRecipe = recipe else {
            return }
        
        /// making core recipe refers to the moc where to save
        let coreRecipe = Recipe(context: core.context)
        coreRecipe.id = Int64(safeRecipe.id)
        coreRecipe.title = safeRecipe.title
        coreRecipe.sourceUrl = safeRecipe.sourceUrl
        coreRecipe.cookingMinutes = Int64(safeRecipe.cookingMinutes ?? 0)
        coreRecipe.glutenFree = safeRecipe.glutenFree ?? false
        coreRecipe.vegan = safeRecipe.vegan ?? false
        coreRecipe.vegetarian = safeRecipe.vegetarian ?? false
        coreRecipe.healthScore = Int64(safeRecipe.healthScore ?? 0)
        coreRecipe.preparationMinutes = Int64(safeRecipe.preparationMinutes ?? 0)
        coreRecipe.likes = Int64(safeRecipe.likes ?? 0)
        /// nils are not allowed in the core data so putting placeholder is good choice
        coreRecipe.image = safeRecipe.image ?? ""
        coreRecipe.veryHealthy = safeRecipe.veryHealthy ?? false
        self.core.save()
        guard let safeAlert = self.core.coreAlert else {
            alertItem = AlertContext.unableToSave
            return
            }
        alertItem = safeAlert
        
    }
}
