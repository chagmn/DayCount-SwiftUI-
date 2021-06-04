//
//  AddItemView.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/24.
//

import SwiftUI
import Combine

// 디데이 항목 추가하는 뷰
struct AddItemView: View {
    @State private var title: String = ""
    @State private var date: String = ""
    @State private var isToggleOn: Bool = false
    @State private var isClickedAddButton: Bool = false
    @State private var dateValue: Date = Date()
    
    @Binding var showAddItemView: Bool
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .center){
            TextField("디데이 제목", text: $title){
                self.hideKeyboard()
            }
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 320, height: 40)
                .background(Color(#colorLiteral(red: 0.8564875722, green: 0.8513966799, blue: 0.8604011536, alpha: 1)))
                .cornerRadius(10)
                .padding(.bottom, 30)
            
            HStack(spacing: 50){
                Toggle("오늘 기준", isOn: $isToggleOn)
                    .frame(width: 130, height: 40)
                
                if isToggleOn{
                    DatePicker(selection: $dateValue, in: Date()...Date(), displayedComponents: .date){
                    }.labelsHidden()

                } else {
                    DatePicker(selection: $dateValue, displayedComponents: .date){
                    }.labelsHidden()
                }
                
            }.padding(.bottom, 50)
            
            Button("추가하기", action:{
                if title != ""{
                    if isToggleOn {
                        date = dateFormatter.string(from: dateValue)+"~"
                    }else{
                        date = "~"+dateFormatter.string(from: dateValue)
                    }
                    self.mainViewModel.addDDay(title: title, date: date, isFromToday: isToggleOn)
                    self.showAddItemView = false
                }
            }).frame(width: 160, height: 35, alignment: .center)
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .contentShape(Rectangle())
        .onTapGesture {
            self.hideKeyboard()
        }
     
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(showAddItemView: .constant(true))
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
