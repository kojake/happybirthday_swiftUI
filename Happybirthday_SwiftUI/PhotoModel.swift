//
//  PhotoModel.swift
//  Happybirthday_SwiftUI
//
//  Created by kaito on 2023/03/24.
//

import Foundation

var photoArray:[PhotoModel] = makePhotoData()

struct PhotoModel: Identifiable{
    var id: Int
    var name: String
    var imageName: String
}

func makePhotoData() ->[PhotoModel]{
    var dataArray:[PhotoModel] = []
    
    dataArray.append(PhotoModel(id: 1, name: "NoImage", imageName: "NoImage"))
    
    return dataArray
}
