//
//  SearchRecipeViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 20/11/2020.
//

import SwiftUI

final class SearchRecipeViewModel: ObservableObject{
    @Published var isShowForm = false
    @Published var ingredients : [IngredientInput] = []
    @Published var ingredientInput:String = ""
    @Published var recipes:[RecipeModel] = []
    @Published var showResults  = false
    @Published var alertItem:AlertItem? = nil
    @Published var isLoading  = false
    var dismissView : Binding<Bool>
    var ingredientsStrings:[String] { ingredients.map {$0.name} }
    
    //MARK:- init for the viewModel binding
    init (dismissView: Binding<Bool>){
        self.dismissView = dismissView
    }
    
    
    func fetchRecipes(ingredients:[String] ) -> Void {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            RecipeServices.sheared.fetchRecipes(ingredients: ingredients) {   result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result{
                        case .success(let recipes):
                            self.recipes = recipes
                            self.showResults = true
                            
                        case .failure(let error):
                            switch error {
                                case .invalidData:
                                    self.alertItem = AlertContext.invalidData
                                case .invalidURL:
                                    self.alertItem = AlertContext.invalidURL
                                case .invalidResponse:
                                    self.alertItem = AlertContext.invalidResponse
                                case .unComplete:
                                    self.alertItem = AlertContext.unComplete
                                case .emptyBody:
                                    self.alertItem = AlertContext.emptyBody
                            }
                    }
                }
            }
            
        }
    }
    func addIngredients(_ name:String)->Void{
        ///validating input
        if name.isEmpty{
            alertItem = AlertContext.emptyInput
            return
        }else{
            ingredients.append(IngredientInput(name: name))
            DispatchQueue.main.async {
                /// after adding a new ingredient dismiss from the view
                self.isShowForm = false
            }
        }
    }
    
    func removeIngredient(at index: IndexSet) -> Void{
        ingredients.remove(atOffsets: index)
    }
}
