//
//  ContentView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//


import SwiftUI

struct Photo: Identifiable {
    var id = UUID()
    var name: String
    var year: String
    var month: String
    var day: String
    var image: UIImage
}

struct MainView: View {
    @State var photos: [Photo] = []
    @State private var showPhotoAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photos) { photo in
                    VStack {
                        Text(photo.name).fontWeight(.black).font(.largeTitle)
                        HStack{
                            Text(photo.year).fontWeight(.black).font(.largeTitle)
                            Text("/")
                            Text(photo.month).fontWeight(.black).font(.largeTitle)
                            Text("/")
                            Text(photo.day).fontWeight(.black).font(.largeTitle)
                            Spacer()
                            Image(uiImage: photo.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .navigationBarTitle("HappyBirthday")
            .navigationBarItems(trailing: Button(action: {
                showPhotoAddView.toggle()
            }) {
                Image(systemName: "plus").padding().background(Color.brown).foregroundColor(.white).clipShape(Circle()).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            })
            .sheet(isPresented: $showPhotoAddView) {
                PhotoAddView(photos: $photos)
            }
        }
    }
}

//struct mainView: View {
//    @State private var showPhotoAddView = false
//
//    @State var birthday_list = [String]()
////    UserDefaults.standard.object(forKey: "birthday_list_key") as! [String]
//
//    //errorlabel
//    @State var error_text = ""
//
//    //生年月日item
//    @State var year = ""
//    @State var month = ""
//    @State var day = ""
//    @State var name = ""
//
//    //photo
//    @State var photos = ""
//
//    //add_birthday_ok_alert
//    @State private var add_birthday_ok = false
//
//    var body: some View {
//        NavigationView {
//                List {
//                    ForEach(photos) { photo in
//                        HStack {
//                            Text(photo.name)
//                            Spacer()
//                            Image(uiImage: photo.image)
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                        }
//                    }
//                }
//                .navigationBarTitle("Photos")
//                .navigationBarItems(trailing: Button(action: {
//                    showPhotoAddView.toggle()
//                }) {
//                    Image(systemName: "plus")
//                })
//                .sheet(isPresented: $showPhotoAddView) {
//                    PhotoAddView(photos: $photos)
//                }
//
//                List{
//                    HStack{
//                        Spacer()
//                        Text("誕生日を覚える人を追加する").font(.title2).fontWeight(.black)
//                        Spacer()
//                    }
//                    VStack{
//                        Text("1.名前を入力してください").font(.title2).fontWeight(.black)
//                    }
//                    HStack{
//                        TextField("自分の名前を入力してください",text: $name)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                    }
//                    VStack{
//                        Text("2.生年月日を入力してください").font(.title2).fontWeight(.black)
//                    }
//                    HStack{
//                        TextField("生まれた年を入力してください",text: $year).keyboardType(.numberPad)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                    }
//                    HStack{
//                        TextField("生まれた月を入力してください",text: $month).keyboardType(.numberPad)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                    }
//                    HStack{
//                        TextField("生まれた日を入力してください",text: $day).keyboardType(.numberPad)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                    }
//                    HStack{
//                        Spacer()
//                        Spacer()
//                    }
//                    VStack{
//                        Text(error_text).font(.title3).fontWeight(.black)
//                    }
//                }
//
//            }
//            .toolbar {
//                ToolbarItem(placement: .keyboard) {
//                    Button("完了") {
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                    }
//                }
//            }
//            //追加しますかの確認alert
//            .alert(isPresented: $add_birthday_ok) {
//                        Alert(title: Text("確認"),
//                              message: Text("\(name):\(japanese_calender)/：\(year)/\(month)/\(day)/で生年月日を追加しますか？"),primaryButton: .cancel(Text("キャンセル")),
//                              secondaryButton: .default(Text("追加"),
//                                                      action: {
//
//                            //誕生日を保存
//                            birthday_list.append(birthday_list_house)
//                            //データ保存
//                            UserDefaults.standard.set(birthday_list, forKey: "birthday_list_key")
//                        }))
//                    }
//        }
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
//            birthday_list_house = ("\(name):\(japanese_calender)/：\(year)/\(month)/\(day)")
//            add_birthday_ok = true
//        }
//    }
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
