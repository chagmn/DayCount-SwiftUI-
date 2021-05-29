//
//  ContentView.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/21.
//

import SwiftUI

// 어플 실행시 처음 보여지는 뷰
struct MainView: View {
    
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
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel()
    
    
    var body: some View{
        VStack(alignment: .center, spacing: 10){
            
            ForEach(mainViewModel.ddaylist, id: \.id){ item in
                ddayView(title: item.title, date: item.date, dday: item.calcDDay())
            }
            
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

struct ddayView: View{
    var title: String
    var date: String
    var dday: String
    
    var body: some View{
        HStack(){
            Text(title)
            
            VStack{
                Text(date)
                Text(dday)
            }.frame(width: 120, height: 50, alignment: .trailing)
            
            
        }.frame(width: UIScreen.main.bounds.width-20, height: 80)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.init(UIColor.systemGray2), lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 20).fill( Color.init(UIColor.systemGray5)))
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
