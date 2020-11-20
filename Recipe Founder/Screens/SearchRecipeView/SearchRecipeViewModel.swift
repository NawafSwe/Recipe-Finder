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
    }
