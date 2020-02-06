//
//  GalleryViewController.swift
//  Albums
//
//  Created by User on 05.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryViewController: UIViewController {
    @IBOutlet weak var galleryTable: UITableView!
    var album: Album!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? PhotoViewController,
                  let photo = sender as? Photo {
                  vc.photo = photo
                            
        }
    }
}

// MARK: - UITableViewDataSource

extension GalleryViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTableViewCell", for: indexPath) as? GalleryTableViewCell else { return UITableViewCell() }
        
        let photo = album.photos[indexPath.row]
        guard let imageURL = URL(string: photo.thumbUrl!) else { return cell }
        cell.photoImageView.load(url: imageURL)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension GalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? GalleryTableViewCell {
            let photo = album.photos[indexPath.row]
                      let image = cell.photoImageView.image
                      performSegue(withIdentifier: "toPhotoVCSegue", sender: photo)
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
