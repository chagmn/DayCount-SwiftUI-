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
            }
        }
    }
            
    init() {
        if let savedDDayData = UserDefaults.standard.data(forKey: "dday") {
            let decoder = JSONDecoder()
            if let loadedDDayData = try? decoder.decode([DDay].self, from: savedDDayData) {
                self.ddaylist = loadedDDayData
                return
            }
        }
    }
    
    func addDDay(title: String, date: String, isFromToday: Bool){
        ddaylist.append(DDay(title: title, date: date, isFromToday: isFromToday))
    }
    
    func deleteDDay(viewID: UUID){
        let deleteButton = Alert.Button.cancel(Text("삭제"))
        let cancelButton = Alert.Button.destructive(Text("취소"))
        
        Alert(title: Text("디데이 삭제"), message: Text("해당 디데이를 제거하시겠습니까?"), primaryButton: deleteButton, secondaryButton: cancelButton)
        if let index = self.ddaylist.firstIndex(where: {$0.id == viewID}){
            self.ddaylist.remove(at: index)
        }
    }
}
