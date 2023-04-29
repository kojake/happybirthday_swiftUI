//
//  detail_View.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/23.
//

import SwiftUI


struct detail_View: View {
    @State var birthday_user_information: birthday_User
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State var image = UserDefaults.standard.object(forKey: "savedImage") as? UIImage
    
    //今日の日にちを取得
    let currentDate = Date()
    let calendar = Calendar.current
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color.gray)
                        .shadow(radius: 10)
                    VStack {
                        Image(uiImage: birthday_user_information.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250.0, height: 250.0)
                            .clipShape(Circle())
                            .shadow(radius: 20)
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
                        Text("\(birthday_user_information.name)さんが好きなことは").font(.title2).fontWeight(.black)
                        VStack{
                            Text(birthday_user_information.what_he_likes).font(.title).fontWeight(.black)
                        }.padding()
                        VStack{
                            Text(daysUntilTargetMessage()).font(.largeTitle).fontWeight(.black)
                        }
                    }
                    .foregroundColor(.yellow)
                }
                Spacer()
            }
        }
    }
    func daysUntilTargetMessage() -> String {
        let todayMonth = calendar.component(.month, from: currentDate)
        let todayDay = calendar.component(.day, from: currentDate)
        let targetMonth = Int(birthday_user_information.month)
        let targetDay = Int(birthday_user_information.day)
        var daysUntilTarget = 0
        
        if todayMonth <= targetMonth! {
            // 同じ年内で目標月が今月より後の場合
            if let date1 = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate), month: todayMonth, day: todayDay)),
               let date2 = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate), month: targetMonth, day: targetDay)) {
                let components = calendar.dateComponents([.day], from: date1, to: date2)
                daysUntilTarget = components.day ?? 0
            }
        } else {
            // 同じ年内で目標月が今月より前の場合
            if let date1 = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate), month: todayMonth, day: todayDay)),
               let date2 = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate) + 1, month: targetMonth, day: targetDay)) {
                let components = calendar.dateComponents([.day], from: date1, to: date2)
                daysUntilTarget = components.day ?? 0
            }
        }
        
        return "誕生日まで後\(daysUntilTarget) 日です。"
    }
}
