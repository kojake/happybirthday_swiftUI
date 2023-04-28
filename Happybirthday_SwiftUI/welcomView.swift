//
//  welcomView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/28.
//

import SwiftUI

struct welcomView: View {
    @State private var shouldShowmain_View = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white // 背景になるビューを指定する
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                
                VStack{
                    NavigationLink(destination: MainView(), isActive: $shouldShowmain_View){
                        EmptyView()
                    }.navigationBarBackButtonHidden(true)
                    
                    Text("大切な人の誕生日を忘れないために").font(.title2).foregroundColor(Color.white).fontWeight(.black)
                        .padding([.top, .bottom], 40)
                    Image("icon")  .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.bottom, 50)
                    Button(action: {
                        shouldShowmain_View = true
                    }) {
                        Text("!さあ、始めよう!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                }
            }.frame(width: 500, height: 1000)
        }
    }
}
struct welcomView_Previews: PreviewProvider {
    static var previews: some View {
        welcomView()
    }
}
