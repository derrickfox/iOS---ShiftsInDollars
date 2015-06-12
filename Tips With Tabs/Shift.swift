//
//  Model.swift
//  Tips With Tabs
//
//  Created by Derrick Fox on 5/20/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

import UIKit
import CoreData

@objc(Shift)
class Shift: NSManagedObject {
    @NSManaged var shiftType: String
    @NSManaged var money: Double
    @NSManaged var date: NSDate
    
}
