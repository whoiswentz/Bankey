//
//  Date+Utils.swift
//  Bankey
//
//  Created by Vinicios Wentz on 04/02/24.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "MDT")
        return dateFormatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "MMM, d, yyyy"
        return dateFormatter.string(from: self)
    }
}
