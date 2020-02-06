//
//  PhotoViewController.swift
//  Albums
//
//  Created by User on 05.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
    }
}
