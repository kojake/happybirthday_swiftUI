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
                TextField("あなたの名前", text: $name).font(.title2).fontWeight(.black)
                TextField("あなたの生まれた年", text: $year).font(.title2).fontWeight(.black)
                TextField("あなたの生まれた月", text: $month).font(.title2).fontWeight(.black)
                TextField("あなたの生まれた日", text: $day).font(.title2).fontWeight(.black)

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
                
            }
            .navigationBarTitle("Add Photo")
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
