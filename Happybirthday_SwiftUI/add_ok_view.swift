//
//  add_ok_view.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/02.
//

import SwiftUI

struct add_ok_view: View {
    @State private var shouldShowmainView = false
    
    var body: some View {
        VStack{
            NavigationLink(destination: mainView(photo: photoArray[0]).previewLayout(.fixed(width: 300, height: 300)), isActive: $shouldShowmainView) {
                EmptyView()
            }
            
            Text("追加しました").font(.largeTitle).fontWeight(.black)
            Text("名前生年月日の内容").font(.largeTitle).fontWeight(.black)
            Text(birthday_list_house).font(.largeTitle).fontWeight(.black)
            Spacer()
            List{
                VStack{
                    Text("最初の画面に戻る方法").font(.title).fontWeight(.black)
                }
                HStack{
                    Text("1.").font(.title).fontWeight(.black)
                    Text("左上にある")
                    Text("back").foregroundColor(.blue)
                    Text("のボタンを押す")
                }
                HStack{
                    Text("2.").font(.title).fontWeight(.black)
                    Text("back").foregroundColor(.blue)
                    Text("を押していくと前の画面に戻る")
                }
                HStack{
                    Text("3.").font(.title).fontWeight(.black)
                    Text("最初の画面になるまで押す")
                }
            }
            Spacer()
        }
    }
}

struct add_ok_view_Previews: PreviewProvider {
    static var previews: some View {
        add_ok_view()
    }
}
