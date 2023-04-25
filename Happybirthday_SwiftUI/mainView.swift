//
//  ContentView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//

import SwiftUI

struct birthday_User: Codable,Identifiable {
    var id = UUID()
    var name: String
    var year: String
    var month: String
    var day: String
    var japanese_calender: String
    var what_he_likes: String
}

struct MainView: View {
    @State var Birthday_User: [birthday_User] = []
    @State var image = UserDefaults.standard.object(forKey: "savedImage") as? UIImage
    //画面遷移用
    @State private var showPhotoAddView = false
    @State private var showstrashView = false
    
    @State var backgroundColor_count = 0
    @State var background_change_button_image = "sun.max.fill"
    @State private var backgroundColor = Color.orange
    @State private var backgroundColor2 = Color.white
    
    init(){
        UITableView.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                backgroundColor2.ignoresSafeArea()
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
                                    if let image = image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                    } else {
                                        Image("NoImage").resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                            .shadow(radius: 7)
                                    }
                                    Text(item.year).fontWeight(.black).font(.title)
                                    Text("/")
                                    Text(item.month).fontWeight(.black).font(.title)
                                    Text("/")
                                    Text(item.day).fontWeight(.black).font(.title)
                                    Spacer()
                                    
                                }
                            }
                        }
                    }.onDelete(perform: { indexSet in
                        Birthday_User.remove(at: indexSet.first!)
                    })
                }
                .navigationBarTitle("HappyBirthday")
                .navigationBarItems(trailing: Button(action: {
                    showPhotoAddView.toggle()
                }) {
                    Image(systemName: "plus").padding().background(Color.brown).foregroundColor(.white).clipShape(Circle()).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                })
                .sheet(isPresented: $showPhotoAddView) {
                    birthday_User_AddView(Birthday_User: $Birthday_User)
                }
                .navigationBarItems(trailing: Button(action:{
                    if backgroundColor_count == 0{
                        background_change_button_image = "moon.fill"
                        backgroundColor = Color.gray
                        backgroundColor2 = Color.black
                        backgroundColor_count = 1
                        
                    }
                    else{
                        background_change_button_image = "sun.max.fill"
                        backgroundColor = Color.orange
                        backgroundColor2 = Color.white
                        backgroundColor_count = 0
                        
                    }
                }){
                    Image(systemName: background_change_button_image).padding().background(backgroundColor).foregroundColor(.white).clipShape(Circle()).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                })
                //削除ボタン
                .navigationBarItems(trailing: EditButton().padding().background(Color.brown).foregroundColor(.white).clipShape(Circle()))        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
