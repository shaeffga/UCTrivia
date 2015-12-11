//
//  Player.swift
//  
//
//  Created by Mitchell J Meyer on 12/10/15.
//
//

import Foundation
import CoreData

class Player: NSManagedObject {

    @NSManaged var userName: String
    @NSManaged var highScore: NSNumber

}
