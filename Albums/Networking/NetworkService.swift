//
//  NetworkService.swift
//  Albums
//
//  Created by User on 04.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import Foundation
import Alamofire


class NetworkService {    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        
        AF.request("https://jsonplaceholder.typicode.com/photos").responseJSON{ response in
            
            if let dictArray = response.value as? [[String: Any]] {
                var albums = [Photo]()
                for dict in dictArray {
                    if let album = Photo.init(with: dict) {
                        albums.append(album)
                    }
                }
                completion(albums)
            }                
        }
    }
}


