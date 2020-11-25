//
//  Struct+Prot.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import CoreData
protocol StructDecoder {
    // The name of our Core Data Entity
    static var EntityName: String { get }
    // Return an NSManagedObject with our properties set
    func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject
}

enum SerializationError: Error {
    // We only support structs
    case structRequired
    // The entity does not exist in the Core Data Model
    case unknownEntity(name: String)
    // The provided type cannot be stored in core data
    case unsupportedSubType(label: String?)
}



extension StructDecoder {
    func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject {
        // Get the name of the Core Data Entity
        let entityName = type(of: self).EntityName

        // Create the Entity Description
        // The entity may not exist, so we're using a 'guard let' to throw
        // an error in case it does not exist in our core data model
        guard let desc = NSEntityDescription.entity(forEntityName: entityName, in: context)
        else { throw SerializationError.unknownEntity(name: entityName) }

        // Create the NSManagedObject
        let managedObject = NSManagedObject(entity: desc, insertInto: context)
        
        // Create a Mirror
        let mirror = Mirror(reflecting: self)

        // Make sure we're analyzing a struct
        guard mirror.displayStyle == .struct else { throw SerializationError.structRequired }
        
        for case let (label?, value) in mirror.children {
            managedObject.setValue(value, forKey: label)
        }
        
        return managedObject
    }
}
