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
    let userDefaults = UserDefaults.standard
    
    //写真選択画面を開く
    @Environment(\.presentationMode) var presentationMode
    //画面を閉じるために使う
    @Environment(\.dismiss) var dismiss
    
    //生年月日
    @State private var name = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    @State var japanese_calender = ""
    @State private var list_bgColor = Color.white
    
    //本人の好きなこと
    let options = ["スポーツや運動をすること","音楽を聴くことや演奏すること"
                   ,"映画やテレビ番組を観ること"
                   ,"旅行することや新しい場所を訪れること"
                   ,"料理や食べ物を楽しむこと"
                   ,"読書や知識を学ぶこと"
                   ,"ゲームをすること"
                   ,"ペットと過ごすことや動物を飼育すること"
                   ,"アウトドア活動や自然を楽しむこと"
                   ,"ショッピングやファッションに興味を持つこと"
                   ,"アートや芸術作品を鑑賞することや作ること"
                   ,"お酒やワイン、ビールを飲むこと"
                   ,"ダンスや音楽に合わせて身体を動かすこと"
                   ,"ヨガや瞑想をすること"
                   ,"パズルや謎解きをすること"
                   ,"クラフトや手芸をすること"
                   ,"ガーデニングや植物を育てること"
                   ,"コンサートやフェスティバルに参加すること"
                   ,"車やバイク、自転車を楽しむこと"
                   ,"テクノロジーやデバイスを使って遊ぶこと"]
    @State private var what_he_likes_selection = ""
    
    //error_alert
    @State private var ShouldShowerror_alert = false
    @State var error_message = ""
    
    //文字数制限
    private let maxPasswordLength = 4
    
    var body: some View {
        NavigationView {
            Form {
                ZStack {
                    Color.white.ignoresSafeArea()
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.fill")
                            TextField("タップして名前を入力", text: $name).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                                .textFieldStyle(.plain)
                                .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                                .textContentType(.emailAddress)
                                .cornerRadius(10)
                                .multilineTextAlignment(.center)
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                                .foregroundColor(.blue)
                        }
                        TextField("タップして年を入力", text: $year).font(.title2).fontWeight(.black).keyboardType(.numberPad).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                            .textFieldStyle(.plain)
                            .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                            .textContentType(.emailAddress)
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .padding(.top, 15)
                            .padding(.bottom, 10)
                            .foregroundColor(.blue)
                        TextField("タップして月を入力", text: $month).font(.title2).fontWeight(.black).keyboardType(.numberPad).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                            .textFieldStyle(.plain)
                            .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                            .textContentType(.emailAddress)
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .padding(.top, 15)
                            .padding(.bottom, 10)
                            .foregroundColor(.blue)
                        TextField("タップして日を入力", text: $day).font(.title2).fontWeight(.black).keyboardType(.numberPad).frame(width: UIScreen.main.bounds.size.width - 80, height: 41, alignment: .center)
                            .textFieldStyle(.plain)
                            .background(Color.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0))
                            .textContentType(.emailAddress)
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .padding(.top, 15)
                            .padding(.bottom, 10)
                            .foregroundColor(.blue)
                    }
                }
                
                VStack{
                    Text("本人の好きなことを選択し下さい").font(.title).fontWeight(.black)
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                        Picker("本人の好きなこと", selection: $what_he_likes_selection) {
                            ForEach(options, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.wheel)
                    }.fontWeight(.black)
                }
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        showingImagePicker.toggle()
                    }) {
                        HStack{
                            Image("photo")
                            Text("写真を選択する")
                        }
                    }.buttonStyle(BlueButtonStyle())
                    Spacer()
                }
                HStack{
                    Text("生年月日と画像を挿入できたら").fontWeight(.black)
                    Text("追加").foregroundColor(.blue)
                    Text("をタップして下さい").fontWeight(.black)
                }
                .alert(isPresented: $ShouldShowerror_alert) {
                    Alert(title: Text("エラー"),
                          message: Text("\(error_message)")
                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("閉じる") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
            
            .navigationBarTitle("誕生日人を追加する")
            .navigationBarItems(leading: Button("✖️"){
                presentationMode.wrappedValue.dismiss()
            })
            .navigationBarItems(trailing: Button("追加") {
                //西暦を保存する
                //生年月日が入力されているかを判断する
                if (name == ""){
                    error_message = "名前が入力されていません"
                    ShouldShowerror_alert = true
                }
                else if (year == ""){
                    error_message = "年が入力されていません"
                    ShouldShowerror_alert = true
                }
                else if (month == ""){
                    error_message = "月が入力されていません"
                    ShouldShowerror_alert = true
                }
                else if (day == ""){
                    error_message = "日が入力されていません"
                    ShouldShowerror_alert = true
                }
                else if Int(month)! >= 13 || Int(month)! <= 0{
                    error_message = "月が13より以上または0以下が入力されています。"
                    ShouldShowerror_alert = true
                }
                else if Int(day)! >= 31 || Int(day)! <= 0{
                    error_message = "日が13より以上または0以下が入力されています。"
                    ShouldShowerror_alert = true
                }
                else if image == nil{
                    error_message = "画像が挿入されていません"
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
                        error_message = "年代が1926より下または2023より大きい数字になっています。修正して下さい"
                        ShouldShowerror_alert = true
                    }
                }
                if let image = image, !name.isEmpty {
                    Birthday_User.append(birthday_User(name: name, year: year, month: month, day: day, japanese_calender: japanese_calender, what_he_likes: what_he_likes_selection, image: image))

                    let encoder = JSONEncoder()
                    guard let encodedData = try? encoder.encode(Birthday_User) else {
                        return
                    }
                    // UserDefaultsに保存する
                    UserDefaults.standard.set(encodedData, forKey: "saved_birthday_users")
                    dismiss()
                    }
            }
                .sheet(isPresented: $showingImagePicker, content: {
                    PhotoModal(image: $image)
                })
            )}
    }
}

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 28, weight:.bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(5)
            .background(Color.blue.opacity(0.8))
            .cornerRadius(20)
            .shadow(color:.black, radius: 4)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}
