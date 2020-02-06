//
//  Album.swift
//  Albums
//
//  Created by User on 04.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import Foundation

struct Photo {
    let albumId: Int
    let id: Int
    var title: String?
    var url: String?
    var thumbUrl: String?
    
    init?(with dict: [String: Any]) {
        guard let albumId = dict["albumId"] as? Int,
            let id = dict["id"] as? Int else {  return nil }
        self.albumId = albumId
        self.id = id
        if let title = dict["title"] as? String {
            self.title = title
        }
        if let url = dict["url"] as? String {
            self.url = url
        }
        if let thumbUrl = dict["thumbnailUrl"] as? String {
            self.thumbUrl = thumbUrl
        }
    }
}

