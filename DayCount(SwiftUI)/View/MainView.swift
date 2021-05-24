//
//  ContentView.swift
//  DayCount(SwiftUI)
//
//  Created by 창민 on 2021/05/21.
//

import SwiftUI

struct MainView: View {
    var mainViewModel: MainViewController
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            titleView()
                .padding(.top, 10)
            
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
    var body: some View{
        VStack(alignment: .leading){
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewController())
    }
}
