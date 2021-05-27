//
//  ContentView.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/21.
//

import SwiftUI

// 어플 실행시 처음 보여지는 뷰
struct MainView: View {
    var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            titleView()
                .padding(.top, 10)
            ddaylistView()
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

struct titleView: View {
    var body: some View{
        VStack(alignment: .leading){
            Text("DayCount").font(.system(size: 35))
        }.padding(.trailing, 190)
    }
}

struct ddaylistView: View{
    @State private var showAddItemView = false
    
    var body: some View{
        VStack(alignment: .leading){
            Button(action: {
                self.showAddItemView.toggle()
            }){
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }.sheet(isPresented: $showAddItemView){
                AddItemView(showAddItemView: self.$showAddItemView)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
