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
    @State private var isSwitchOn: Bool = false
    @State private var isClickedAddButton: Bool = false
    
    var addItemViewModel: AddItemViewModel = AddItemViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            TextField("디데이 제목", text: $title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .background(Color(#colorLiteral(red: 0.5966893435, green: 0.5931452513, blue: 0.5994156003, alpha: 1)))
                .frame(width: 320)
                .clipped()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack(spacing: 15){
                TextField("년/월/일", text: $date)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .background(Color(#colorLiteral(red: 0.5966893435, green: 0.5931452513, blue: 0.5994156003, alpha: 1)))
                    .frame(width: 180)
                    .clipped()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                
                Toggle("오늘 기준", isOn: $isSwitchOn)
                    .frame(width: 130, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                // 오늘 기준 토글이 on이 되면
                if isSwitchOn{
                    
                }
            }.padding(.bottom, 30)
            Button("추가하기"){
                self.isClickedAddButton.toggle()
            }.frame(width: 160, height: 35, alignment: .center)
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
           
            //.position(x: UIScreen.main.bounds.width/2)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
