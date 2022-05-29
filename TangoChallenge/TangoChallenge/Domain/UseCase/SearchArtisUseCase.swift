//
//  SearchArtisUseCase.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-29.
//

import Foundation

protocol SearchArtistUseCase{
    var repository: ArtistRepository { get }
    func execute(completion: @escaping (Artist) -> Void)
}

final class SearchArtisUseCaseByName: SearchArtistUseCase{
    
    var name: String
    
    var repository: ArtistRepository
    
    func execute(completion: @escaping (Artist) -> Void) {
        repository.fetchArtistList(from: self.name, completion: completion)
    }
    
    init(name: String, repository: ArtistRepository){
        self.repository = repository
        self.name = name
    }
}
