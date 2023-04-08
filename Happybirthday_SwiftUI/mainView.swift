//
//  ContentView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//

import SwiftUI

struct mainView: View {
    @State private var shouldShowPhotoadd_View = false
    
    @State var birthday_list = [String]()
//    UserDefaults.standard.object(forKey: "birthday_list_key") as! [String]
    
    var photo: PhotoModel
    
    //errorlabel
    @State var error_text = ""
    
    //生年月日item
    @State var year = ""
    @State var month = ""
    @State var day = ""
    @State var name = ""
    
    //add_birthday_ok_alert
    @State private var add_birthday_ok = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Photoadd_view(), isActive: $shouldShowPhotoadd_View) {
                    EmptyView()
                }.navigationBarBackButtonHidden(true)
                
                Text("HAPPYBIRTHDAY").font(.largeTitle).fontWeight(.black)
                Spacer()
                List(photoArray){ item in
                    HStack{
                        ImageRowView(photo: item)
                    }
                    ForEach(0 ..< birthday_list.count, id: \.self){ item in
                        Text(birthday_list[item])
                    }.font(.title2).fontWeight(.black)
                }.scrollContentBackground(.hidden)
                    .background(Color.gray).listRowSeparator(.automatic)
                
                List{
                    HStack{
                        Spacer()
                        Text("誕生日を覚える人を追加する").font(.title2).fontWeight(.black)
                        Spacer()
                    }
                    VStack{
                        Text("1.名前を入力してください").font(.title2).fontWeight(.black)
                    }
                    HStack{
                        TextField("自分の名前を入力してください",text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    VStack{
                        Text("2.生年月日を入力してください").font(.title2).fontWeight(.black)
                    }
                    HStack{
                        TextField("生まれた年を入力してください",text: $year).keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    HStack{
                        TextField("生まれた月を入力してください",text: $month).keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    HStack{
                        TextField("生まれた日を入力してください",text: $day).keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            add_birthday_list()
                            print(birthday_list)
                        }){
                            Circle().foregroundColor(.brown).frame(width:100,height: 100).shadow(radius: 50).overlay(
                                Text("追加").fontWeight(.black).font(.title).foregroundColor(.white)
                            )
                        }
                        Spacer()
                    }
                    VStack{
                        Text(error_text).font(.title3).fontWeight(.black)
                    }
                }

            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("完了") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
            //追加しますかの確認alert
            .alert(isPresented: $add_birthday_ok) {
                        Alert(title: Text("確認"),
                              message: Text("\(name):\(japanese_calender)/：\(year)/\(month)/\(day)/で生年月日を追加しますか？"),primaryButton: .cancel(Text("キャンセル")),
                              secondaryButton: .default(Text("追加"),
                                                      action: {
                            birthday_list.append(birthday_list_house)
                            //データ保存
                            UserDefaults.standard.set(birthday_list, forKey: "birthday_list_key")
                            
                            //写真追加画面へ遷移
                            shouldShowPhotoadd_View = true
                        }))
                    }
        }
    }
    func add_birthday_list(){
        if (name == "") || (year == "") || (month == "") || (day == ""){
            error_text = "どこかの欄が入力されていません"
        }
        else{
            if (Int(year)! >= 1926) && (Int(year)! <= 1989){
                japanese_calender = "昭和"
            }
            else if (Int(year)! >= 1990) && (Int(year)! <= 2019){
                japanese_calender = "平成"
            }
            else if (Int(year)! >= 2020) && (Int(year)! <= 2023){
                japanese_calender = "令和"
            }
            
            //詳細
            error_text = ""
            birthday_list_house = ("\(name):\(japanese_calender)/：\(year)/\(month)/\(day)")
            add_birthday_ok = true
        }
    }
}

struct ImageRowView: View {
    @State var photo: PhotoModel

    var body: some View {
        HStack {
            Spacer()
            Image(photo.imageName).resizable().frame(width:150, height: 140).clipShape(Circle()).overlay(Circle()
                .stroke(Color.gray, lineWidth: 8))
                .shadow(radius: 20)

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        mainView(photo: photoArray[0]).previewLayout(.fixed(width: 300, height: 300))
    }
}
