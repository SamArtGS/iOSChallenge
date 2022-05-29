//
//  SearchAlbumUseCase.swift
//  AlbumTango
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import Foundation

protocol SearchAlbumsUseCase{
    var repository: AlbumsRepository { get }
    func execute(completion: @escaping ([Album]) -> Void)
}

final class AlbumSearchUseCaseByArtist: SearchAlbumsUseCase{
    
    let repository: AlbumsRepository
    let artist: Artist
    
    func execute(completion: @escaping ([Album]) -> Void) {
        repository.fetchAlbumList(from: artist.id, completion: completion)
    }
    
    init(artist: Artist,repository: AlbumsRepository){
        self.repository = repository
        self.artist = artist
    }
}
