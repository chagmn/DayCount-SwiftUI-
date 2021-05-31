//
//  DDay.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/24.
//

import SwiftUI

// 디데이 정보를 갖는 모델
struct DDay {
    var id: UUID = UUID()
    var title: String
    var date: String
    var isFromToday: Bool
    
    init(title: String, date: String, isFromToday: Bool){
        self.title = title
        self.date = date
        self.isFromToday = isFromToday
    }
    
    func calcDDay() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") as TimeZone?
        let todayDate: Date = dateFormatter.date(from: dateFormatter.string(from: Date()))!
        let ddayDate: Date = dateFormatter.date(from: date)!
        
        var interval: TimeInterval
        
        if isFromToday {    // 오늘부터 'on'
            interval = todayDate.timeIntervalSince(ddayDate)
            return "D+"+String(Int(interval/86400))
        } else {
            interval = ddayDate.timeIntervalSince(todayDate)
            return "D-"+String(Int(interval/86400))
        }
        
    }
}
