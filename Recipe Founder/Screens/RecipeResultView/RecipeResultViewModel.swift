//
//  RecipeResultViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 22/11/2020.
//

import Foundation
import SwiftUI
final class RecipeResultViewModel : ObservableObject{
    @Published var recipe:RecipeModel?{
        didSet{showDetail = true}
    }
    @Published var showDetail = false
     var dismiss:Binding<Bool>
     var recipes : Binding<[RecipeModel]>
    
    init(dismiss:Binding<Bool> , recipes : Binding<[RecipeModel]>){
        self.dismiss = dismiss
        self.recipes = recipes
    }
}
