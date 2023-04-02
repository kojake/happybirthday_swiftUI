//
//  Photoadd_view.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/25.
//

import SwiftUI

struct Photoadd_view: View {
    //追加されていないalert
    @State private var Additional_checks = false
    @State private var Photo_Add_ok_alert = false
    @State var showingImagePicker = false
    @State private var shouldShowmainView = false
    
    var photo_id = 1
    
    //画像
    @State private var image: UIImage?
    
    var body: some View {
        VStack{
            Text("写真を追加する").fontWeight(.black).font(.title)
            List{
                VStack{
                    Text("3.写真選択してください").fontWeight(.black).font(.title)
                }
                HStack{
                    Button(action: {
                        self.showingImagePicker.toggle()
                    }){
                        Circle().foregroundColor(.brown).frame(width:200,height: 130).shadow(radius: 50).overlay(
                            Text("選択する").fontWeight(.black).font(.title).foregroundColor(.white)
                        )
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                    }
                    //選択された画像
                    if let uiImage = image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                        
                    } else {
                        Image("NoImage").resizable().frame(width:150, height: 140).clipShape(Circle()).overlay(Circle()
                            .stroke(Color.gray, lineWidth: 9))
                            .shadow(radius: 20)
                    }
                }
                
                
                VStack{
                    Text("4.追加ボタンを押してください").font(.title2).fontWeight(.black)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        if add_photo_yes_not == 1{
                            Photo_Add_ok_alert = true
                        }
                        else{
                            add_list()
                        }
                    }){
                        Circle().foregroundColor(.brown).frame(width:100,height: 100).shadow(radius: 50).overlay(
                            Text("追加").fontWeight(.black).font(.title).foregroundColor(.white)
                        )
                    }
                    Spacer()
                }
            }.scrollContentBackground(.hidden)
                .background(Color.gray)
            
                //Photoadd_ok_alert
                .alert(isPresented: $Photo_Add_ok_alert) {
                            Alert(title: Text("確認"),
                                  message: Text("写真が選択されていませんが追加しますか？"),primaryButton: .cancel(Text("キャンセル")),
                                  secondaryButton: .default(Text("追加"),
                                                          action: {
                                //写真を保存
                                var dataArray:[PhotoModel] = []
                                dataArray.append(PhotoModel(id: photo_id, name: "NoImage", imageName: "NoImage"))
                            }))
                        }
        }
    }
    
    func add_list(){
        //写真を保存
        var dataArray:[PhotoModel] = []
        dataArray.append(PhotoModel(id: photo_id, name: String(photo_id), imageName: String(photo_id)))
        
        //写真idを足す
        photo_id + 1
        print("photoid",photo_id)
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
}
    struct Photoadd_view_Previews: PreviewProvider {
        static var previews: some View {
            Photoadd_view()
        }
    }
