//
//  Album.swift
//  Albums
//
//  Created by User on 04.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import Foundation

class Album {
    var photos: [Photo] = [Photo]()
    let albumId: Int
    let firstPhotoId: Int
    var lastPhotoId: Int = 0
    
    init(albumId: Int, firstPhotoId: Int) {
        self.albumId = albumId
        self.firstPhotoId = firstPhotoId
    }
}
