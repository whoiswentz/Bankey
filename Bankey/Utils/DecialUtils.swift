//
//  DecialUtils.swift
//  Bankey
//
//  Created by Vinicios Wentz on 03/02/24.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
