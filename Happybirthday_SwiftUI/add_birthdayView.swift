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
    
    //写真選択画面遷移
    @State private var shouldShowPhotoadd_view = false
    
    //追加されていないalert
    @State private var enter_not_alert = false
    @State private var Additional_checks = false
    @State private var Add_ok_alert = false
    
    var body: some View {
        //写真選択画面遷移
        NavigationView {
            VStack {
                NavigationLink(destination: Photoadd_view(), isActive: $shouldShowPhotoadd_view) {
                    EmptyView()
                }
            }
        }
                VStack{
                    Text("誕生日を覚える友達を増やす").font(.title2).fontWeight(.black)
                    Spacer()
                    List{
                        VStack{
                            Text("1.名前を入力してください").font(.title2).fontWeight(.black)
                        }
                        HStack{
                            TextField("自分の名前を入力してください",text: $name)
                        }
                        VStack{
                            Text("2.生年月日を入力してください").font(.title2).fontWeight(.black)
                        }
                        HStack{
                            TextField("生まれた年を入力してください",text: $year).keyboardType(.numberPad)
                        }
                        HStack{
                            TextField("生まれた月を入力してください",text: $month).keyboardType(.numberPad)
                        }
                        HStack{
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
                            Button(action: {
                                shouldShowPhotoadd_view = true
                                add_list()
                            }){
                                Circle().foregroundColor(.brown).frame(width:100,height: 100).shadow(radius: 50).overlay(
                                    Text("次へ").fontWeight(.black).font(.title).foregroundColor(.white)
                                )
                            }
                        }
                    }
                }
            }
            func add_list(){
                birthday_list_house = "\(name):\("平成")/：\(year)/\(month)/\(day)"
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

