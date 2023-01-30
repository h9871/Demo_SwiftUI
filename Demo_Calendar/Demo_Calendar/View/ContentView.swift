//
//  ContentView.swift
//  Demo_Calendar
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 1) {
            DateScrollerView()
                .environmentObject(dateHolder)
            .padding()

            dayOfWeekStack
            calendarGrid
        }
        .offset(offset)
        .gesture(
            DragGesture()
                .onChanged { action in
                    offset = action.translation
                }
                .onEnded { action in
                    offset = .zero
                }
        )
    }
    
    var dayOfWeekStack: some View {
        HStack(spacing: 1) {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
    }
    
    var calendarGrid: some View {
        VStack(spacing: 1) {
            
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let weeksInMonth = CalendarHelper().weeksInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            
            ForEach(0..<weeksInMonth, id: \.self) { row in
                HStack(spacing: 1) {
                    ForEach(1..<8) { colum in
                        let count = colum + (row * 7)
                        CalendarCell(count: count,
                                     startingSpaces: startingSpaces,
                                     daysInMonth: daysInMonth,
                                     daysInPrevMonth: daysInPrevMonth)
                        .environmentObject(dateHolder)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateHolder())
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
