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
var add_photo_yes_not = 1

@main
struct Happybirthday_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
