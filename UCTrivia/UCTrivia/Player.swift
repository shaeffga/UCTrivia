//
//  Player.swift
//
//
//  Created by Mitchell J Meyer on 12/10/15.
//
//

import Foundation
import CoreData

public class Player: NSManagedObject {
    
    @NSManaged var userName: String
    @NSManaged var highScore: NSNumber
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, userName: String, highScore: Int) -> Player {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Player", inManagedObjectContext: moc) as! Player
        newItem.userName = userName
        newItem.highScore = highScore
        
        return newItem
    }
    
}