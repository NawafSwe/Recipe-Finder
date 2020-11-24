//
//  Alert.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import Foundation
import SwiftUI
struct AlertItem:Identifiable{
    var id = UUID()
    var title:Text
    var message:Text
    var dismissButton:Alert.Button
}


//MARK:- AlertContext
/// Alert Context has all different alerts types
struct AlertContext{ }
