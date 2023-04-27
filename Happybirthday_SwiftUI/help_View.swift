//
//  help_View.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/27.
//

import SwiftUI

struct help_View: View {
    //画面を閉じるために使う
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack{
                Text("HELP").font(.largeTitle).fontWeight(.black)
                Text("____________________").fontWeight(.black).font(.largeTitle)
                HStack{
                    Image("questionmark.circle.fill")
                    Text("誕生日を覚えている人を削除したのに削除されていない").font(.title2).fontWeight(.black)
                }.padding()
            }
        }.navigationBarItems(leading: Button("✖️"){
            presentationMode.wrappedValue.dismiss()
        })

    }
}
struct help_View_Previews: PreviewProvider {
    static var previews: some View {
        help_View()
    }
}
