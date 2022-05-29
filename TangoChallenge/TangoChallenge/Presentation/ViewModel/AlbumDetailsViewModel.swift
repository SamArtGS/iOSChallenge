//
//  AlbumDetailsViewModel.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

protocol AlbumViewModelDetails: AlbumViewModel{
    var releaseDate         : NSMutableAttributedString { get }
    var price               : NSMutableAttributedString { get }
    var goURLButtonEnable   : Bool                      { get }
}

class AlbumDetailsViewModel: AlbumViewModelDetails{
    
    //MARK: - Properties
    var model: Album
    
    var title: NSMutableAttributedString {
        let attribString = NSMutableAttributedString(string: model.albumName,
                                                     attributes: [ .font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                                                   .foregroundColor: UIColor.complementAccent
        ])
        return attribString
    }

    var artist: NSMutableAttributedString {
        let attribString = NSMutableAttributedString(string: model.artistName,
                                                     attributes: [ .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                                                                   .foregroundColor: UIColor.gray
        ])
        return attribString
    }
    
    var releaseDate: NSMutableAttributedString {
        let attribString = NSMutableAttributedString(string: model.releaseDate,
                                                     attributes: [ .font: UIFont.systemFont(ofSize: 14, weight: .regular),
                                                                   .foregroundColor: UIColor.lightGray])
        return attribString
    }
    
    var imageAlbum: URL? {
        if model.albumArtWork.isEmpty {
            return nil
        }else{
            return URL(string: model.albumArtWork)
        }
    }

    var numberSongs: NSMutableAttributedString {
        let label = NSMutableAttributedString(string: "\t\(NSLocalizedString("songsquantity", comment: ""))   ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)])
        let attribString = NSMutableAttributedString(string: "\(model.trackCount)", attributes: [.font:UIFont.boldSystemFont(ofSize: 22)])
        label.append(attribString)
        return label
    }

    var price: NSMutableAttributedString {
        let label = NSMutableAttributedString(string: "\t \(NSLocalizedString("price", comment: "")):   ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)])
        let price = NSMutableAttributedString(string: "$\(model.price)", attributes: [.font:UIFont.boldSystemFont(ofSize: 25)])
        label.append(price)
        return label
    }
    
    var goURLButtonEnable: Bool {
        model.urlReference == "" ? true : false
    }
    
    
    init(album: Album) {
        self.model = album
    }
    
    
}
