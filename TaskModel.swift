//
//  TaskModel.swift
//  Taskit
//
//  Created by ankurchdry on 5/10/15.
//  Copyright (c) 2015 ankurchdry. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)

class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var subTask: String
    @NSManaged var task: String
    @NSManaged var date: NSDate

}
