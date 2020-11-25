//
//  DataStore.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import Foundation
import CoreData
/// using singleton pattern

/// What we are doing here is importing the CoreData framework, and again, using the singleton pattern, creating a static "shared" variable that holds the one instance of the class. I then create my persistent container referencing my data model file, keeping this all in a lazy var that will only instantiate when I eventually call it from ContentView. I also create the "saveContext()" method which we can call upon running any CRUD action on our data. If all this looks familiar it's because this is what was previously generated for us in our old AppDelegate files.

class DataStore{
    static let shared = DataStore()
    
    /// accessing the container
    let persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name:"RecipeCore")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
            
        }
        return container
    }()
    
    private init(){ }
    
    /// trying to save to the model
    public func saveContext(){
        let context = persistentContainer.viewContext
        if  context.hasChanges{
            do{
                try context.save()
            }catch{
                print(error)
            }
        }
    }
}

