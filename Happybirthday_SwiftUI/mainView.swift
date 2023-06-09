//
//  ContentView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//
import SwiftUI

struct birthday_User: Codable, Identifiable{
    var id = UUID()
    var name: String
    var year: String
    var month: String
    var day: String
    var japanese_calender: String
    var what_he_likes: String
    var imageData: Data?
    
    init(name: String, year: String, month: String, day: String, japanese_calender: String, what_he_likes: String, image: UIImage) {
        self.name = name
        self.year = year
        self.month = month
        self.day = day
        self.japanese_calender = japanese_calender
        self.what_he_likes = what_he_likes
        self.imageData = image.data
    }
    
    var image: UIImage? {
        guard let imageData = imageData else { return nil }
        return UIImage(data: imageData)
    }
}


struct MainView: View {
    @State var Birthday_User: [birthday_User] = []
    
    //画面遷移用
    @State private var showPhotoAddView = false
    @State private var showShould_help_View = false
    
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    init(){
        //Userdefaultsから情報を読み込む
        UITableView.appearance().backgroundColor = .clear
        
        if let data = UserDefaults.standard.data(forKey: "saved_birthday_users"),
           let savedBirthdayUsers = try? JSONDecoder().decode([birthday_User].self, from: data) {
            self._Birthday_User = State(initialValue: savedBirthdayUsers)
        } else {
            self._Birthday_User = State(initialValue: [])
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("icon").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: deviceWidth/10, height: deviceHeight/2.2)
                    .position(x: deviceWidth/2, y: deviceHeight/2.5)
                    .opacity(0.2)
                ZStack{
                    List {
                        ForEach(Birthday_User) { item in
                            NavigationLink(destination: detail_View(birthday_user_information: item)){
                                VStack{
                                    HStack{
                                        Text("名前").fontWeight(.black).font(.title)
                                        Text(item.name).fontWeight(.black).font(.title2)
                                        Spacer()
                                        Text("西暦").fontWeight(.black).font(.title)
                                        Text(item.japanese_calender).fontWeight(.black).font(.largeTitle)
                                    }
                                    HStack{
                                        Image(uiImage: item.image!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 70.0, height: 70.0)
                                            .clipShape(Circle())
                                            .shadow(radius: 20)
                                        Text(item.year).fontWeight(.black).font(.title)
                                        Text("/")
                                        Text(item.month).fontWeight(.black).font(.title)
                                        Text("/")
                                        Text(item.day).fontWeight(.black).font(.title)
                                        Spacer()
                                        
                                    }
                                }.listRowBackground(Color.random)
                            }
                        }.onDelete(perform: { indexSet in
                            Birthday_User.remove(at: indexSet.first!)
                            Birthday_User.remove(atOffsets: indexSet)
                            let encoder = JSONEncoder()
                            guard let encodedData = try? encoder.encode(Birthday_User) else {
                                return
                            }
                            UserDefaults.standard.set(encodedData, forKey: "saved_birthday_users")
                        })
                    }
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {
                                showPhotoAddView.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .background(Color.yellow)
                                    .clipShape(Circle())
                                    .frame(width: 80, height: 80)
                            }.shadow(radius: 20)
                        }
                    }
                }.onAppear{
                    loadData()
                }
                    .background(Color.clear)
                    .navigationBarTitle("/🎂🎁誕生日リスト🎁🎂/")
                    .navigationBarItems(leading: Text("削除するならeditボタン→").fontWeight(.black))
                    .navigationBarItems(trailing: EditButton()                       .bold()
                        .padding()
                        .frame(width: 50, height: 40)
                        .foregroundColor(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple, lineWidth: 3)
                        ))        }
                .sheet(isPresented: $showPhotoAddView) {
                    birthday_User_AddView(Birthday_User: $Birthday_User)
                }
        }.navigationBarBackButtonHidden(true)
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "saved_birthday_users") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([birthday_User].self, from: data) {
                Birthday_User = decodedData
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
extension UIImage {
    var data: Data? {
        return self.jpegData(compressionQuality: 1.0)
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
