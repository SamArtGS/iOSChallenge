//
//  AlbumCellViewModel.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

protocol AlbumViewModel{
    var model       : Album { get }
    var title       : NSMutableAttributedString { get }
    var artist      : NSMutableAttributedString { get }
    var imageAlbum  : URL?                      { get }
    var numberSongs : NSMutableAttributedString { get }
}

class AlbumCellViewModel: AlbumViewModel{
    
    var model: Album
    
    //MARK: A
    var title: NSMutableAttributedString {
        let title = NSMutableAttributedString(string: model.albumName, attributes: [ .font: UIFont.systemFont(ofSize: 20,
                                                                                                              weight: .bold),
                                                                                     .foregroundColor: UIColor.complementAccent]
        )
        return title
    }

    var artist: NSMutableAttributedString {
        let artist = NSMutableAttributedString(string: model.artistName, attributes: [ .font: UIFont.boldSystemFont(ofSize: 14),
                                                                                      .foregroundColor: UIColor.gray]
        )
        return artist
    }

    var numberSongs: NSMutableAttributedString {
        let numberSongs = NSMutableAttributedString(string: "\(model.trackCount)", attributes: [.font:UIFont.boldSystemFont(ofSize: 14)])
        return numberSongs
    }
    
    var imageAlbum: URL? {
        if model.albumArtWork.isEmpty {
            return nil
        }else{
            return URL(string: model.albumArtWork)
        }
    }
    
    init(album: Album) {
        self.model = album
    }
}
