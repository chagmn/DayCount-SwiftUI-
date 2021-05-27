//
//  AddItemViewModel.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/25.
//

import Foundation
import Combine

class AddItemViewModel: ObservableObject {
    @Published var ddaylist: [DDay] = []
    
    
    func addDDay(title: String, date: String, isFromToday: Bool){
        ddaylist.append(DDay(title: title, date: date, isFromToday: isFromToday))
    }
}
