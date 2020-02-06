//
//  ViewController.swift
//  Albums
//
//  Created by User on 04.02.2020.
//  Copyright © 2020 andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var tableView: UITableView!
    
    private let networkService = NetworkService()
    private var albums = [Album]()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        networkService.getPhotos { [weak self] (photos) in
            guard let self = self else { return }
            self.albums = self.createAlbumsFrom(photos: photos)
            self.tableView.reloadData()
        }
    }
    
// MARK: - Private func
    
    private func createAlbumsFrom(photos: [Photo]) -> [Album] {
        
        for photo in photos {
            if let album = albums.filter({ $0.albumId == photo.albumId }).first {
                album.photos.append(photo)
                album.lastPhotoId = photo.id
            } else {
                let album = Album.init(albumId: photo.albumId, firstPhotoId: photo.id)
                album.photos.append(photo)
                album.lastPhotoId = photo.id
                albums.append(album)
            }
        }
        
        return albums
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGalleryVCSegue" {
            if let vc = segue.destination as? GalleryViewController,
                let album = sender as? Album {
                vc.album = album
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let album = albums[indexPath.row]
        cell.textLabel?.text = "Album id = \(album.albumId)  \(album.firstPhotoId) - \(album.lastPhotoId)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        performSegue(withIdentifier: "toGalleryVCSegue", sender: album)
    }
}

