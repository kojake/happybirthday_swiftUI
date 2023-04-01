//
//  Happybirthday_SwiftUIApp.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/17.
//

import SwiftUI

var japanese_calender = ""
var birthday_list_house = ""
var error_text = ""

@main
struct Happybirthday_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            mainView(photo: photoArray[0]).previewLayout(.fixed(width: 300, height: 300))
        }
    }
}
