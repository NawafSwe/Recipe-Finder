//
//  SavedRecipeViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import SwiftUI
final class SavedRecipeViewModel:ObservableObject{
    @Published var recipe:RecipeModel?{
        didSet{showDetail = true}
    }
    @Published var showDetail = false
    
}
