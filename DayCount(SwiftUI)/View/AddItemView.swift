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
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("디데이 제목", text: $title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .background(Color(#colorLiteral(red: 0.5966893435, green: 0.5931452513, blue: 0.5994156003, alpha: 1)))
                .frame(width: 300)
                .clipped()
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
