//
//  AddItemView.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/24.
//

import SwiftUI

// 디데이 항목 추가하는 뷰
struct AddItemView: View {
    @State private var title: String = ""
    @State private var date: String = ""
    @State private var isToggleOn: Bool = false
    @State private var isClickedAddButton: Bool = false
    
    @ObservableObject var addItemViewModel: AddItemViewModel = AddItemViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            TextField("디데이 제목", text: $title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 320, height: 40)
                .background(Color(#colorLiteral(red: 0.8564875722, green: 0.8513966799, blue: 0.8604011536, alpha: 1)))
                .cornerRadius(10)
                .padding(.bottom, 30)
                           
            HStack(spacing: 15){
                TextField("연도 / 월 / 일", text: $date)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 180, height: 40)
                    .background(Color(#colorLiteral(red: 0.8564875722, green: 0.8513966799, blue: 0.8604011536, alpha: 1)))
                    .cornerRadius(10)
                    
                
                Toggle("오늘 기준", isOn: $isToggleOn)
                    .frame(width: 130, height: 40)
                
                if isToggleOn{
                    
                }
                // 오늘 기준 토글이 on이 되면
           
            }.padding(.bottom, 50)
            
            Button("추가하기"){
                self.isClickedAddButton.toggle()
            }.frame(width: 160, height: 35, alignment: .center)
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
        
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
