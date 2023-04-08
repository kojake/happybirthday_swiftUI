//
//  Photoadd_view.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/25.
//
import SwiftUI

struct PhotoAddView: View {
    @Binding var photos: [Photo]

    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    @Environment(\.presentationMode) var presentationMode
    
    //生年月日
    @State private var name = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    
    
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
                
            }
            .navigationBarTitle("誕生日人を追加する")
            .navigationBarItems(trailing: Button("追加") {
                if let image = image, !name.isEmpty {
                    photos.append(Photo(name: name, year: year, month: month, day: day ,image: image))
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .sheet(isPresented: $showingImagePicker, content: {
                PhotoModal(image: $image)
            })
        }
    }
}
