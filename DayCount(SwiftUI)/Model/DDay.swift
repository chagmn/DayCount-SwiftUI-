//
//  DDay.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/24.
//

import Foundation

// 디데이 정보를 갖는 모델
struct DDay {
    var title: String
    var date: String
    var isFromToday: Bool
    
    init(title: String, date: String, isFromToday: Bool){
        self.title = title
        self.date = date
        self.isFromToday = isFromToday
    }
}
