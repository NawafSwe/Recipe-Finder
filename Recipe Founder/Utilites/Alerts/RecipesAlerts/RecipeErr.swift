//
//  RecipeErr.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 24/11/2020.
//

import Foundation
import SwiftUI

extension AlertContext{
    static let emptyInput = AlertItem(title: Text("Invalid Input"), message: Text("Please ingredient Cannot be empty String "), dismissButton: .default(Text("Got It!")))
}
