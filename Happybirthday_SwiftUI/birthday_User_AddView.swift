//
//  Photoadd_view.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/25.
//
import SwiftUI
struct birthday_User_AddView: View {
    @Binding var Birthday_User: [birthday_User]
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    let userDefaults = UserDefaults.standard
    
    //画面を閉じる
    @Environment(\.presentationMode) var presentationMode
    
    //生年月日
    @State private var name = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    @State var japanese_calender = ""
    
    //error_alert
    @State private var ShouldShowerror_alert = false
    
    //文字数制限
    private let maxPasswordLength = 4
    
    var body: some View {
        NavigationView {
            Form {
                Text("誕生日の人の名前と生年月日を入力して下さい").font(.title2).fontWeight(.black)
                TextField("タップして名前を入力", text: $name).font(.title2).fontWeight(.black)
                TextField("タップして年を入力", text: $year).font(.title2).fontWeight(.black).keyboardType(.numberPad)
                TextField("タップして月を入力", text: $month).font(.title2).fontWeight(.black).keyboardType(.numberPad)
                TextField("タップして日を入力", text: $day).font(.title2).fontWeight(.black).keyboardType(.numberPad)
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                }
                Button(action: {
                    showingImagePicker.toggle()
                }) {
                    Text("写真を選択する")
                }
                HStack{
                    Text("生年月日と画像を挿入できたら").fontWeight(.black)
                    Text("追加").foregroundColor(.blue)
                    Text("をタップして下さい").fontWeight(.black)
                }
                
                .alert(isPresented: $ShouldShowerror_alert) {
                    Alert(title: Text("エラー"),
                          message: Text("生年月日のどれかの欄が入力されていません又は、年が1926年から2023の間で入力されていない"))
                }
            }
            .navigationBarTitle("誕生日人を追加する")
            .navigationBarItems(leading: Button("✖️"){
                presentationMode.wrappedValue.dismiss()
            })
            .navigationBarItems(trailing: Button("追加") {
                //西暦を保存する
                //生年月日が入力されているかを判断する
                if (name == "") || (year == "") || (month == "") || (day == ""){
                    //生年月日が入力されていないなら、erroralertを表示する
                    ShouldShowerror_alert = true
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
                    else{
                        ShouldShowerror_alert = true
                    }
                }
            }
        )}.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $image)
            }
            .onDisappear {
                if let imageData = image?.toData() {
                    userDefaults.set(imageData, forKey: "savedImage")
                    Birthday_User.append(birthday_User(name: name, year: year, month: month, day: day,japanese_calender: japanese_calender))
                }
            }
    }
    func loadImage() {
            guard let inputImage = image else { return }
            let imageData = inputImage.toData()
            userDefaults.set(imageData, forKey: "savedImage")
        }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: Image?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Do nothing
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

extension Image {
    func toData() -> Data? {
        guard let uiImage = UIImage(systemName: "circle.fill"), let imageData = uiImage.pngData() else { return nil }
        return imageData
    }
}
