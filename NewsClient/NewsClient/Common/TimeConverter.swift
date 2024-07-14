//
//  TimeConverter.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 14.07.2024.
//

import Foundation

class TimeConverter {
    
    private static func strFor(_ timeInt: Int) -> String {
        
        var str = ""
        
        let minute: Int = 60
        let hour: Int = 60*60
        let day: Int = 60*60*24
        let threeDays: Int = 60*60*24*3
        let week: Int = 60*60*24*7
        let weeksInYear = 60*60*24*7*52
        
        switch timeInt {
        case 0...minute:
            str = AppStrings.TimeConverter_now.localized
        case minute...hour:
            let localizedStr = AppStrings.TimeConverter_m_ago.localized
            str = "\(timeInt/minute)\(localizedStr)"
        case hour...threeDays:
            let localizedStr = AppStrings.TimeConverter_h_ago.localized
            str = "\(timeInt/hour)\(localizedStr)"
        case threeDays...week:
            let localizedStr = AppStrings.TimeConverter_d_ago.localized
            str = "\(timeInt/day)\(localizedStr)"
        case week...weeksInYear:
            let localizedStr = AppStrings.TimeConverter_w_ago.localized
            str = "\(timeInt/week)\(localizedStr)"
        default:
            str = AppStrings.TimeConverter_ancient.localized
        }
        
        return str
    }
    
    static func converteDateToPastTime(_ dateStr: String?) -> String {
        
        var strPastTime = ""
        
        if let str = dateStr {
            
            let isoDate = str//"2016-04-14T10:44:00+0000"

            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from:isoDate)!
            
            let timeInterval = date.timeIntervalSinceNow
            
            let timeIntervalInt = Int(timeInterval)
            
            let timeIntervalSinceNow = timeIntervalInt > 0 ? timeIntervalInt : timeIntervalInt * (-1)
            
            strPastTime = strFor(timeIntervalSinceNow)
        }
        
        return strPastTime
    }
}
