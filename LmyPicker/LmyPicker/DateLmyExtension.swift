//
//  DateLmyExtension.swift
//  limuyun
//
//  Created by limuyun on 2016/12/20.
//  Copyright © 2016年 biiway. All rights reserved.
//

import Foundation

public extension Date {
    
    static func date_form(str: String?) -> Date? {
        
        return self.date_from(str: str, formatter: "yyyy-MM-dd HH:mm:ss")
    }
    
    static func date_from(str: String?, formatter: String?) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        if let da_formatter = formatter {
            dateFormatter.dateFormat = da_formatter
            if let time_str = str {
                let date = dateFormatter.date(from: time_str)
                return date
            }
        }
        return nil
    }
    
    func string_from(formatter: String?) -> String {
        
        if let format = formatter {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = format
            let date_str = dateFormatter.string(from: self)
            return date_str
        }
        return ""
    }
}
public extension NSDate {
    
    class func date_form(str: String?) -> NSDate? {
        
        return self.date_from(str: str, formatter: "yyyy-MM-dd HH:mm:ss")
    }
    class func date_from(str: String?, formatter: String?) -> NSDate? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        if let da_formatter = formatter {
            dateFormatter.dateFormat = da_formatter
            if let time_str = str {
                let date = dateFormatter.date(from: time_str)
                return date as NSDate?
            }
        }
        return nil
    }
    func string_from(formatter: String?) -> String {
        
        if let format = formatter {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = format
            let date_str = dateFormatter.string(from: self as Date)
            return date_str
        }
        return ""
    }
}
