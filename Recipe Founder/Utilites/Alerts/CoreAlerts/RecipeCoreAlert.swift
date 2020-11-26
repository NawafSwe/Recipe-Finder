//
//  RecipeCoreErr.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import SwiftUI


extension AlertContext {
    static let successSaved = AlertItem(title: Text("Success"), message: Text("You Successfully saved the recipe"), dismissButton:.default(Text("COOL!")) )
    
    static let unableToSave = AlertItem(title: Text("Failure"), message: Text("Failed to save recipe please if the problem persist contact the developers team to help you"), dismissButton:.default(Text("Got it")) )
    
    static let unableToDelete = AlertItem(title: Text("Failure"), message: Text("Failed to Delete the recipe from your list please if the problem persist contact the developers team to help you"), dismissButton:.default(Text("Got it")) )
    
    static let successDelete = AlertItem(title: Text("Success"), message: Text("You successfully deleted the recipe hope you enjoy it 😄"), dismissButton:.default(Text("Thanks!")) )
    
    
    static let duplicate = AlertItem(title: Text("Failure"), message: Text(" OPPS! it is seems like the recipe exists in your saved Recipe List 🤪"), dismissButton:.default(Text("Thanks!")) )
    
}
