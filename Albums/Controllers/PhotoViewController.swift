//
//  PhotoViewController.swift
//  Albums
//
//  Created by User on 05.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            guard let imageURL = URL(string: photo.url!) else { return  }
            photoImageView.load(url: imageURL)
            titleLabel.text = photo.title
        
    }
}
