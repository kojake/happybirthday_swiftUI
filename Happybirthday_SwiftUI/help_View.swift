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
                Text("_________________").fontWeight(.black).font(.largeTitle)
                Spacer()
                HStack{
                    Image(systemName:"q.circle.fill").font(.largeTitle).foregroundColor(.blue)
                    Text("誕生日を覚えている人を削除したのに削除されていない").font(.title2).fontWeight(.black)
                }
                VStack{
                    ForEach(0..<3){index in
                        Text(" ")
                    }
                }
                HStack{
                    Image(systemName: "a.circle.fill").font(.largeTitle).foregroundColor(.red)
                    Text("同じ情報の人を二回追加していませんか？もし同じ情報の人が二人いましたら二人とも追加しないといけません").font(.title3).fontWeight(.black)
                }
                Spacer()
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
