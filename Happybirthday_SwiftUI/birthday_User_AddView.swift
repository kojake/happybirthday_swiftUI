//
//  Photoadd_view.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/25.
//
import SwiftUI

struct birthday_User_AddView: View {
    @Binding var Birthday_User: [birthday_User]

    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    @Environment(\.presentationMode) var presentationMode
    
    //生年月日
    @State private var name = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    @State var japanese_calender = ""
    
    //error_alert
    @State private var ShouldShowerror_alert = false
    
    var body: some View {
        NavigationView {
            Form {
                Text("誕生日の人の名前と生年月日を入力して下さい").font(.title2).fontWeight(.black)
                TextField("タップして名前を入力", text: $name).font(.title2).fontWeight(.black)
                TextField("タップして年を入力", text: $year).font(.title2).fontWeight(.black)
                TextField("タップして月を入力", text: $month).font(.title2).fontWeight(.black)
                TextField("タップして日を入力", text: $day).font(.title2).fontWeight(.black)

                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                Button(action: {
                    showingImagePicker.toggle()
                }) {
                    Text("写真を選択する")
                }
                HStack{
                    Text("追加する場合は右上にある").fontWeight(.black)
                    Text("追加").foregroundColor(.blue)
                    Text("をタップして下さい").fontWeight(.black)
                }
                
                .alert(isPresented: $ShouldShowerror_alert) {
                    Alert(title: Text("エラー"),
                          message: Text("どこかの欄が入力または画像が挿入されていません"))
                }
                
            }
            .navigationBarTitle("誕生日人を追加する")
            .navigationBarItems(trailing: Button("追加") {
                
                //西暦を保存する
                if (name == "") || (year == "") || (month == "") || (day == ""){
                    
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
                }
                
                if let image = image, !name.isEmpty {
                    Birthday_User.append(birthday_User(name: name, year: year, month: month, day: day , japanese_calender: japanese_calender ,image: image))
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .sheet(isPresented: $showingImagePicker, content: {
                PhotoModal(image: $image)
            })
        }
    }
}
