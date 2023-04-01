//
//  test.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/04/01.
//

import SwiftUI

struct test: View {
    var photo: PhotoModel
    
    var body: some View {
        List(photoArray){item in
            test(photo: item)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test(photo: photoArray[1])
    }
}
