//
//  Album.swift
//  AlbumTango
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

struct Album: Identifiable{
    
    typealias Identifier = Int
    
    //MARK: - Properties
    
    let id               : Identifier
    let artistName       : String
    let albumName        : String
    let albumArtWork     : String
    let trackCount       : Int
    let releaseDate      : String
    let price            : Float
    let urlReference     : String
    
    //MARK: - Initializer
    
    init(id: Identifier,      artistName  : String,
         albumName  : String, albumArtWork: String,
         trackCount : Int,    releaseDate : String,
         price      : Float,  urlReference: String){
        
        self.id           = id
        self.artistName   = artistName
        self.albumName    = albumName
        self.albumArtWork = albumArtWork
        self.trackCount   = trackCount
        self.releaseDate  = releaseDate
        self.price        = price
        self.urlReference = urlReference
    }
}

extension Album: Equatable {
    
    static func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id
    }
    
}
