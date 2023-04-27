//
//  ContentView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//

import SwiftUI

struct birthday_User: Identifiable {
    var id = UUID()
    var name: String
    var year: String
    var month: String
    var day: String
    var japanese_calender: String
    var what_he_likes: String
    var image: UIImage
}

struct MainView: View {
    @State var Birthday_User: [birthday_User] = []
    //画面遷移用
    @State private var showPhotoAddView = false
    @State private var showstrashView = false
    
    init(){
        UITableView.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        NavigationView {
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
                                Image(uiImage: item.image)
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
                        }
                    }
                }.onDelete(perform: { indexSet in
                    Birthday_User.remove(at: indexSet.first!)
                })
            }
            .background(Color.clear)
            .navigationBarTitle("HappyBirthday")
            .navigationBarItems(trailing: Button(action: {
                showPhotoAddView.toggle()
            }) {
                Image(systemName: "plus").padding().background(Color.brown).foregroundColor(.white).clipShape(Circle()).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            })
            .sheet(isPresented: $showPhotoAddView) {
                birthday_User_AddView(Birthday_User: $Birthday_User)
            }
            //削除ボタン
            .navigationBarItems(trailing: EditButton().padding().background(Color.brown).foregroundColor(.white).clipShape(Circle()))        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
