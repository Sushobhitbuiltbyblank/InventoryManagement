//
//  DateAndTime.swift
//  Night Way
//
//  Created by Mac1 on 08/09/15.
//  Copyright (c) 2015 Kennedia. All rights reserved.
//

import UIKit

class DateAndTime {
    
    static let sharedInstance : DateAndTime = {
        let instance = DateAndTime()
        return instance
    }()
    
    func convertDateComponentToDateString(component : DateComponents?, usingFormat format : String) -> String {
        
        if let theComponent = component {
            let calendar = Calendar.current
            if let date = calendar.date(from: theComponent) {
                let convertDateStr = self.convertDateToString(date: date, usingFormat: format)
                return convertDateStr
            }
        }
        return String()
    }
    
    func convertDateToString(date: Date, usingFormat format : String)->String {
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let formattedDate : String = dateFormatter.string(from: date)
        return formattedDate
    }
   

    func getUTCDateFromDateString(dateTime : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss'Z'"
        var dateToReturn : Date = Date()
        if let date : Date = dateFormatter.date(from: dateTime)
        {
            dateToReturn = date
        }
        return dateToReturn
    }

    func convertCurrentDateToStringUsingFormat(format : String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format // superset of OP's format
        let dateStr = dateFormatter.string(from: Date())
        return dateStr
    }
    
    func convertCurrentDateToDateUsingFormat(format : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format // superset of OP's format
        let dateStr = dateFormatter.string(from: Date())
        let date = self.convertStringToDateUsingFormat(date: dateStr, format: format)
        return date
    }

    
    func convertStringToUTCDate(date : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"// superset of OP's format
        var dateToReturn : Date = Date()
        if let date : Date = dateFormatter.date(from: date)
        {
            dateToReturn = date
        }
        return dateToReturn
    }
    
    func convertStringToDateUsingFormat(date : String, format : String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        let date : Date = dateFormatter.date(from: date)! as Date
        return date
    }
    
    func convertStringTimeToDate(time : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss" // superset of OP's format
        var dateToReturn : Date = Date()
        if let date : Date = dateFormatter.date(from: time)
        {
            dateToReturn = date
        }
        return dateToReturn
    }
    
     func convertSecsToHourMiec(sec : TimeInterval) -> (Int, Int, Int)
     {
        let seconds : Int = Int (sec)
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    

    func perform(calendar : Calendar,fromDate: Date?, toDate: Date?) -> Int {
        
        let difference = calendar.dateComponents([.day], from: fromDate!, to: toDate!)
        return difference.day!
    }
    
     func timeAgoStringFromDate(date: Date) -> String? {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .weekOfMonth, .day, .hour, .minute], from: date, to: now)

        if components.year! > 0 {
            formatter.allowedUnits = .year
        } else if components.month! > 0 {
            formatter.allowedUnits = .month
        } else if components.weekOfMonth! > 0 {
            formatter.allowedUnits = .weekOfMonth
        } else if components.day! > 0 {
            formatter.allowedUnits = .day
        } else if components.hour! > 0 {
            formatter.allowedUnits = .hour
        } else if components.minute! > 0 {
            formatter.allowedUnits = .minute
        } else {
            formatter.allowedUnits = .second
        }
        
        let formatString = NSLocalizedString("%@ ago", comment: "Used to say how much time has passed. e.g. '2 hours ago'")
        
        guard let timeString = formatter.string(from: components) else {
            return nil
        }
        return String(format: formatString, timeString)
    }
}

extension Date {
    
    init?(jsonDate: String) {
        let prefix = "/Date("
        let suffix = ")/"
        let scanner = Scanner(string: jsonDate)
        
        // Check prefix:
        guard scanner.scanString(prefix, into: nil)  else { return nil }
        
        // Read milliseconds part:
        var milliseconds : Int64 = 0
        guard scanner.scanInt64(&milliseconds) else { return nil }
        // Milliseconds to seconds:
        var timeStamp = TimeInterval(milliseconds)/1000.0
        
        // Read optional timezone part:
        var timeZoneOffset : Int = 0
        if scanner.scanInt(&timeZoneOffset) {
            let hours = timeZoneOffset / 100
            let minutes = timeZoneOffset % 100
            // Adjust timestamp according to timezone:
            timeStamp += TimeInterval(3600 * hours + 60 * minutes)
        }
        
        // Check suffix:
        guard scanner.scanString(suffix, into: nil) else { return nil }
        
        // Success! Create NSDate and return.
        self.init(timeIntervalSince1970: timeStamp)
    }
}
