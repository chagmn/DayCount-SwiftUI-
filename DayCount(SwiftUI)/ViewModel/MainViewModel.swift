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
    @Published var ddaylist: [DDay] = []{
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(ddaylist){
                UserDefaults.standard.set(encoded, forKey: "dday")
                print("save")
            }
        }
    }
    
    func addDDay(title: String, date: String, isFromToday: Bool){
        ddaylist.append(DDay(title: title, date: date, isFromToday: isFromToday))
    }
        
    init() {
        print("init")
        if let savedDDayData = UserDefaults.standard.data(forKey: "dday") {
            let decoder = JSONDecoder()
            if let loadedDDayData = try? decoder.decode([DDay].self, from: savedDDayData) {
                self.ddaylist = loadedDDayData
                print("load")
                return
            }
        }
        
    }
}
