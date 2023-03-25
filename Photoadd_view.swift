//
//  Photoadd_view.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/25.
//

import SwiftUI

struct Photoadd_view: View {
    var body: some View {
        VStack{
            Text("写真")
            List{
                VStack{
                    Text("3.写真選択してください").fontWeight(.black).font(.title)
                }
                HStack{
                    Button(action: {

                    }){
                        Circle().foregroundColor(.brown).frame(width:200,height: 130).shadow(radius: 50).overlay(
                            Text("選択する").fontWeight(.black).font(.title).foregroundColor(.white)
                        )
                    }
                    //選択された画像
                    Image("NoImage")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle()).shadow(radius: 10).overlay(Rectangle()
                            .stroke(.black, lineWidth: 10).cornerRadius(10))
                }
                VStack{
                    Text("4.追加ボタンを押してください").font(.title2).fontWeight(.black)
                    
                    }

                        //not_enter_alert
                        .alert(isPresented: $enter_not_alert) {
                            Alert(title: Text("注意"),
                                  message: Text("どこかの欄が入力されていません"))
                        }

                        //確認画面
                        .alert(isPresented: $Additional_checks) {
                            Alert(title: Text("警告"),
                                  message: Text("名前：" + String(name) + "生年月日" + "\("平成")：\(year)/\(month)/\(day)" + "で追加しますか"),
                                  primaryButton: .cancel(Text("キャンセル")),
                                  dismissButton: .default(Text("追加"),action: {print("")}))
                        }
                    }
                }
            }
        }

struct Photoadd_view_Previews: PreviewProvider {
    static var previews: some View {
        Photoadd_view()
    }
}
