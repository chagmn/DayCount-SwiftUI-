//
//  ContentView.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/21.
//

import SwiftUI

// 어플 실행시 처음 보여지는 뷰
struct MainView: View {
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel()
    
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
    @ObservedObject var mainViewModel = MainViewModel()
    
    var body: some View{
        VStack(alignment: .center, spacing: 10){
            
            ForEach(mainViewModel.ddaylist, id: \.id){ item in
                if item.isFromToday {
                    ddayView(title: item.title, date: item.date+"~", dday: item.calcDDay())
                }
                else{
                    ddayView(title: item.title, date: "~"+item.date, dday: item.calcDDay())
                }

            }

            Button(action: {
                self.showAddItemView.toggle()
            }){
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }.sheet(isPresented: $showAddItemView){
                AddItemView(showAddItemView: self.$showAddItemView).environmentObject(mainViewModel)
            }
        }
    }
}

struct ddayView: View{
    var title: String
    var date: String
    var dday: String
    
    var body: some View{
        HStack(alignment: .center){
            Text(title)
                .frame(width: UIScreen.main.bounds.width/2.2, alignment: .leading)
                .padding()

            VStack(alignment: .trailing, spacing: 5){
                Text(date)
                Text(dday)
                    .font(.title)
            }.frame(width: 120, alignment: .trailing)
            .padding()

        }.frame(width: UIScreen.main.bounds.width-20, height: 80, alignment: .leading)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.init(UIColor.systemGray2), lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill( Color.init(UIColor.systemGray5)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
