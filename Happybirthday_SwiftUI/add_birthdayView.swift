//
//  add_birthday.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//
import UIKit
import SwiftUI
import Combine

////キーボードを閉じる
//extension UIApplication {
//    func endEditing() {
//        sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil,for: nil)
//    }
//}
//
struct add_birthdayView: View{
//    //生年月日item
//    @State var year = ""
//    private let maxyearLength = 4
//    @State var month = ""
//    private let maxmonthLength = 2
//    @State var day = ""
//    private let maxdayLength = 2
//    @State var name = ""
//
//    //写真選択画面遷移
//    @State private var shouldShowPhotoadd_view = false
//
//    //add_birthday_ok_alert
//    @State private var add_birthday_ok = false
//
    var body: some View {
        VStack {
//            NavigationLink(destination: Photoadd_view(), isActive: $shouldShowPhotoadd_view) {
//                EmptyView()
//            }
        }
//
        VStack{
//            Text("誕生日を覚える友達を増やす").font(.title2).fontWeight(.black)
//            Spacer()
//            List{
//                VStack{
//                    Text("1.名前を入力してください").font(.title2).fontWeight(.black)
//                }
//                HStack{
//                    TextField("自分の名前を入力してください",text: $name)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                }
//                VStack{
//                    Text("2.生年月日を入力してください").font(.title2).fontWeight(.black)
//                }
//                HStack{
//                    TextField("生まれた年を入力してください",text: $year).keyboardType(.numberPad)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding().onReceive(Just(year)) { _ in
//                            if year.count > maxyearLength {
//                                // 最大文字数超えた場合は切り捨て
//                                year = String(year.prefix(maxyearLength))
//                            }
//                        }
//                }
//                HStack{
//                    TextField("生まれた月を入力してください",text: $month).keyboardType(.numberPad)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding().onReceive(Just(month)) { _ in
//                            if month.count > maxmonthLength {
//                                // 最大文字数超えた場合は切り捨て
//                                month = String(month.prefix(maxmonthLength))
//                            }
//                        }
//                }
//                HStack{
//                    TextField("生まれた日を入力してください",text: $day).keyboardType(.numberPad)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding().onReceive(Just(day)) { _ in
//                            if day.count > maxdayLength {
//                                // 最大文字数超えた場合は切り捨て
//                                day = String(day.prefix(maxdayLength))
//                            }
//                        }
//                }
//                HStack{
//                    Spacer()
//                    Button(action: {
//                        add_birthday_list()
//                    }){
//                        Circle().foregroundColor(.brown).frame(width:100,height: 100).shadow(radius: 50).overlay(
//                            Text("次へ").fontWeight(.black).font(.title).foregroundColor(.white)
//                        )
//                    }
//                    Spacer()
//                }
//            }.scrollContentBackground(.hidden)
//                .background(Color.gray)
//            VStack{
//                Text(error_text).font(.title2).fontWeight(.black)
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .keyboard) {
//                Button("完了") {
//                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                }
//            }
//        }
//        //追加しますかの確認alert
//        .alert(isPresented: $add_birthday_ok) {
//                    Alert(title: Text("確認"),
//                          message: Text("\(name):\(japanese_calender)/：\(year)/\(month)/\(day)/で生年月日を追加しますか？"),primaryButton: .cancel(Text("キャンセル")),
//                          secondaryButton: .default(Text("追加"),
//                                                  action: {
//                        birthday_list.append(birthday_list_house)
//                        UserDefaults.standard.set(birthday_list, forKey: "birthday_list_key")
//                        shouldShowPhotoadd_view = true
//                    }))
//                }
//    }
//    func add_birthday_list(){
//        if (name == "") || (year == "") || (month == "") || (day == ""){
//            error_text = "どこかの欄が入力されていません"
//        }
//        else{
//            if (Int(year)! >= 1926) && (Int(year)! <= 1989){
//                japanese_calender = "昭和"
//            }
//            else if (Int(year)! >= 1990) && (Int(year)! <= 2019){
//                japanese_calender = "平成"
//            }
//            else if (Int(year)! >= 2020) && (Int(year)! <= 2023){
//                japanese_calender = "令和"
//            }
//
//            //詳細
//            error_text = ""
//            birthday_list_house = "\(name):\(japanese_calender)/：\(year)/\(month)/\(day)"
//            add_birthday_ok = true
        }
    }
}
struct add_birthday_Previews: PreviewProvider {
    static var previews: some View {
        add_birthdayView()
    }
}
