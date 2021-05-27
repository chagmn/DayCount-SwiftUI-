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
    @State private var isToggleOn: Bool = true
    @State private var isClickedAddButton: Bool = false
    @State private var dateValue: Date = Date()
    
    @Binding var showAddItemView: Bool
    
    @ObservedObject var addItemViewModel: AddItemViewModel = AddItemViewModel()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .center){
            TextField("디데이 제목", text: $title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 320, height: 40)
                .background(Color(#colorLiteral(red: 0.8564875722, green: 0.8513966799, blue: 0.8604011536, alpha: 1)))
                .cornerRadius(10)
                .padding(.bottom, 30)
                           
            HStack(spacing: 50){
                Toggle("오늘 기준", isOn: $isToggleOn)
                    .frame(width: 130, height: 40)
                
                
                DatePicker(selection: $dateValue, in: ...Date(), displayedComponents: .date){
                   // Text("\(dateField, formatter: dateFormatter)")
                }.labelsHidden()
              
                
            }.padding(.bottom, 50)
            
            Button("추가하기", action: {
                addButtonDidTap()
            }).frame(width: 160, height: 35, alignment: .center)
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            
        }
    }
    
    func addButtonDidTap(){
        self.addItemViewModel.title = title
        self.addItemViewModel.date = dateFormatter.string(from: dateValue)
        self.addItemViewModel.calcDDay()
        self.showAddItemView = false
        
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(showAddItemView: .constant(true))
    }
}
