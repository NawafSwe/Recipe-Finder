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
    var message:Text
    var title:Text
    var dissmisButton:Alert.Button
    }

