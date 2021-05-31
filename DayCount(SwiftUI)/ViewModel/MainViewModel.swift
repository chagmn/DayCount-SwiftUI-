//
//  AddItemViewModel.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/25.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject, Identifiable {
    // 모델이 바뀌면 뷰를 업데이트 해주라는 의미
    @Published var ddaylist: [DDay] = []
    
    func addDDay(title: String, date: String, isFromToday: Bool){
        ddaylist.append(DDay(title: title, date: date, isFromToday: isFromToday))        
    }
}
