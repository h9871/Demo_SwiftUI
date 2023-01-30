//
//  Demo_CalendarApp.swift
//  Demo_Calendar
//

import SwiftUI

@main
struct Demo_CalendarApp: App {
    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            ContentView()
                .environmentObject(dateHolder)
        }
    }
}
