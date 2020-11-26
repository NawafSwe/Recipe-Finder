//
//  SavedRecipeViewModel.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import SwiftUI
import CoreData
    final class SavedRecipeViewModel:NSObject ,NSFetchedResultsControllerDelegate , ObservableObject{
        @Published var recipe:RecipeModel?{
            didSet{showDetail = true}
        }
        @Published var showDetail = false
        var core = DataStore.shared
        @Published var alertItem: AlertItem? = nil
    }
    

