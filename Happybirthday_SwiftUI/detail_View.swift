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
            VStack{
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250.0, height: 250.0, alignment: .center)
                        .border(Color.blue, width: 3.0)
                        .clipped()
                } else {
                    Image("NoImage").resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .shadow(radius: 7)
                }
            }
            Text("\(birthday_user_information.name)さんの詳細").font(.title).fontWeight(.black)
            Text("誕生日は\(birthday_user_information.year)年\(birthday_user_information.month)月\(birthday_user_information.day)日です。").font(.title2).fontWeight(.black)
            Text("和暦は\(birthday_user_information.japanese_calender)です。").font(.title2).fontWeight(.black)
            Spacer()
        }
    }
}
