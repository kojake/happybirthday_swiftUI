//
//  detail_View.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/23.
//

import SwiftUI

struct detail_View: View {
    @State var birthday_user_information: birthday_User
    @State var image = UserDefaults.standard.object(forKey: "savedImage") as? UIImage

    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color.gray)
                    .shadow(radius: 10)
                VStack {
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250.0, height: 250.0, alignment: .center)
                            .border(Color.blue, width: 3.0)
                            .clipped()
                    } else {
                        Image("NoImage").resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 7)
                    }
                    HStack{
                        Spacer()
                        Text("🎊")
                        Text("🥳")
                        Text("㊗️")
                        Spacer()
                        Text("🎊")
                        Text("🥳")
                        Text("㊗️")
                        Spacer()
                    }.font(.largeTitle).fontWeight(.black)
                    Text("\(birthday_user_information.name)さんの詳細").font(.title).fontWeight(.black)
                    Text("誕生日は\(birthday_user_information.year)年\(birthday_user_information.month)月\(birthday_user_information.day)日です。").font(.title2).fontWeight(.black)
                    Text("和暦は\(birthday_user_information.japanese_calender)です。").font(.title2).fontWeight(.black)
                    Text("\(birthday_user_information.name)さんが好きなことは\(birthday_user_information.what_he_likes)です")
                    
                }
                .foregroundColor(.yellow)
            }
            Spacer()
        }
    }
}
