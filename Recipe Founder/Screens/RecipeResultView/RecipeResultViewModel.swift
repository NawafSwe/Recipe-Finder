//
//  RecipeResultViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 22/11/2020.
//

import Foundation
final class RecipeResultViewModel : ObservableObject{
    @Published var recipe:RecipeModel?{
        didSet{showDetail = true}
    }
    @Published var showDetail = false
}
