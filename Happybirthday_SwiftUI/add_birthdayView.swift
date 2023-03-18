//
//  add_birthday.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//

import UIKit
import SwiftUI

//キーボードを閉じる
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),to: nil, from: nil,for: nil)
    }
}

struct add_birthdayView: View{
    //生年月日item
    @State var year = ""
    @State var month = ""
    @State var day = ""
    @State var name = ""
    var japanese_calender = ""
    
    //icon
    @State private var image: UIImage?
    
//    let date_of_birth = "\(name):\(japanese_calender)：\(year)/\(month)/\(day)"
    
    //追加されていないalert
    @State private var year_enter_not_alert = false
    @State private var month_enter_not_alert = false
    @State private var day_enter_not_alert = false
    @State private var Additional_checks = false
    
    var body: some View {
        VStack{
            Text("誕生日を覚える友達を増やす").font(.title).fontWeight(.black)
            Spacer()
            List{
                VStack{
                    Text("1.名前を入力してください").font(.title2).fontWeight(.black)
                }
                HStack{
                    Text("名前")
                    TextField("自分の名前を入力してください",text: $year)
                }
                VStack{
                    Text("2.生年月日を入力してください").font(.title2).fontWeight(.black)
                }
                HStack{
                    Text("年")
                    TextField("生まれた年を入力してください",text: $year).keyboardType(.numberPad)
                }
                HStack{
                    Text("月")
                    TextField("生まれた月を入力してください",text: $month).keyboardType(.numberPad)
                }
                HStack{
                    Text("日")
                    TextField("生まれた日を入力してください",text: $day).keyboardType(.numberPad)
                }
                HStack{
                    Text("閉じるボタンを押せば   キーボードを閉じれます。").font(.title3).fontWeight(.black)
                    Spacer()
                    Button(action: {
                        UIApplication.shared.endEditing()
                    }){
                        Circle().foregroundColor(.brown).frame(width:90,height: 90).shadow(radius: 50).overlay(
                            Text("閉じる").fontWeight(.black).font(.title).foregroundColor(.white)
                        )
                    }
                }
                VStack{
                    Text("     3.写真選択してください").fontWeight(.black).font(.title)
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
                    Button(action: {
                        if year == ""{
                            year_enter_not_alert = true
                        }
                        else if month == ""{
                            month_enter_not_alert = true
                        }
                        else if day == ""{
                            day_enter_not_alert = true
                        }
                        else{
                            Additional_checks = true
                        }
                        
                    }){
                        Circle().foregroundColor(.brown).frame(width:100,height: 100).shadow(radius: 50).overlay(
                            Text("追加").fontWeight(.black).font(.title).foregroundColor(.white)
                        )
                        
                        //not_enter_alert
                        .alert(isPresented: $year_enter_not_alert) {
                            Alert(title: Text("注意"),
                                  message: Text("年の入力欄が入力されていません"))
                        }
                        .alert(isPresented: $month_enter_not_alert) {
                            Alert(title: Text("注意"),
                                  message: Text("月の入力欄が入力されていません"))
                        }
                        .alert(isPresented: $day_enter_not_alert) {
                            Alert(title: Text("注意"),
                                  message: Text("日の入力欄が入力されていません"))
                        }
                        
                        //追加確認
                        .alert(isPresented: $Additional_checks) {
                            Alert(title: Text("確認"),
                                  message: Text("日の入力欄が入力されていません"))
                        }
                    }
                }
            }
        }
    }
    func add_list(){

        
    }
    }
    
    //写真を選択
    struct ImagePicker: UIViewControllerRepresentable {
        var sourceType: UIImagePickerController.SourceType = .photoLibrary
        
        @Binding var selectedImage: UIImage?
        @Environment(\.presentationMode) private var presentationMode
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = sourceType
            imagePicker.delegate = context.coordinator
            
            return imagePicker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            
        }
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(self)
        }
        
        final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            
            var parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                if let image = info[.originalImage] as? UIImage {
                    parent.selectedImage = image
                }
                
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    struct add_birthday_Previews: PreviewProvider {
        static var previews: some View {
            add_birthdayView()
        }
    }
