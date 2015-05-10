//
//  date.swift
//  Taskit
//
//  Created by ankurchdry on 3/14/15.
//  Copyright (c) 2015 ankurchdry. All rights reserved.
//

import Foundation

class Date {
    
    class func from (#year:Int, month:Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        
        var date =  gregorianCalendar?.dateFromComponents(components)
        
        return date!
        
    }
    
    class func toString (#date:NSDate) -> String {
        
        var dateStringFormatter = NSDateFormatter()
        
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateStringFormatter.stringFromDate(date)
        
        return dateString
    }
    
}