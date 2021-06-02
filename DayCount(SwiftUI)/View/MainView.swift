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
            ddaylistView()
                .padding(.top, 30)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ddaylistView: View{
    @State private var showAddItemView = false
    @State private var showAlert = false
    @ObservedObject var mainViewModel = MainViewModel()
    
    var body: some View{
        VStack(alignment: .center, spacing: 10){
            ForEach(mainViewModel.ddaylist, id: \.id){ item in
                ddayView(title: item.title, date: item.date, dday: item.calcDDay())
                    .gesture(DragGesture(minimumDistance: 100)
                                .onChanged{ value in
                                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                    self.showAlert.toggle()
                                })
                    .alert(isPresented: $showAlert, content: {
                        let deleteButton = Alert.Button.cancel(Text("삭제"), action: {
                            mainViewModel.deleteDDay(viewID: item.id, title: item.title)
                        })
                        let cancelButton = Alert.Button.destructive(Text("취소"))
                        
                        return Alert(title: Text("디데이 삭제"), message: Text("해당 디데이를 제거하시겠습니까?"), primaryButton: deleteButton, secondaryButton: cancelButton)
                    })
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
        HStack(spacing: 0){
            Text(title)
                .frame(width: UIScreen.main.bounds.width/2.5, alignment: .leading)
                .padding(.leading)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5){
                Text(date)
                    .frame(width: 150, alignment: .trailing)
                
                Text(dday)
                    .font(.title)
                
            }.frame(width: UIScreen.main.bounds.width/2.5, alignment: .trailing)
            .padding(.trailing)
            
            
        }.frame(width: UIScreen.main.bounds.width-20, height: 80, alignment: .leading)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.init(UIColor.systemGray2), lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill( Color.init(UIColor.systemGray5)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
