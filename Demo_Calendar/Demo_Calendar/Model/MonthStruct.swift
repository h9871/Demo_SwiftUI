//
//  MonthStruct.swift
//  Demo_Calendar
//

import Foundation

struct MonthStruct {
    var monthType: MonthType
    var dayInt: Int
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType {
    case Previous
    case Current
    case Next
}
