//
//  ContentView.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//

import SwiftUI

struct mainView: View {
    @State private var shouldShowadd_birthdayView = false
    var photo: PhotoModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: add_birthdayView(), isActive: $shouldShowadd_birthdayView) {
                    EmptyView()
                }
                
                Text("HAPPYBIRTHDAY").font(.largeTitle).fontWeight(.black)
                Spacer()
                List(0..<birthday_list.count){ item in
                    HStack{
                        Image(photo.name)
                        Text(birthday_list[item])
                    }
                }
                HStack{
                    Spacer()
                    Button(action: {
                        shouldShowadd_birthdayView = true
                    }){
                        Circle().foregroundColor(.brown).frame(width:100,height: 100).shadow(radius: 50).overlay(
                            Text("+").fontWeight(.black).font(.title).foregroundColor(.white)
                        )
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        mainView(photo: photoArray[0]).previewLayout(.fixed(width: 300, height: 300))
    }
}
