//
//  ArtistRepository.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-29.
//

import Foundation

protocol ArtistRepository{
    var networkStatus: InternetStatus { get set }
    func fetchArtistList(from name: String,
                        completion: @escaping (Artist) -> Void)
}

final class DefaultArtistRepository: ArtistRepository{
    
    var networkStatus: InternetStatus
    
    let itunesAPIEndPoint: iTunesAPI = iTunesAPI()
    
    init(){
        networkStatus = .online
    }
    
    public func fetchArtistList(from name: String, completion: @escaping (Artist) -> Void) {
        switch networkStatus {
        case .online:
            loadRemote(from: name, completion: completion)
        case .offline:
            loadLocal(from: name)
        }
    }
    
    private func loadLocal(from name: String){
       
            let _ = Album(id: 1,
                  artistName: "Samuel Garrido",
                  albumName: "Samuel Garrido",
                  albumArtWork: "F",
                  trackCount: 123,
                  releaseDate: "09-09-12",
                  price: 0.0,
                  urlReference: "httpts"
            )
    }
    
    private func loadRemote(from name: String, completion: @escaping (Artist) -> Void) {
        var artist: Artist?
        
        itunesAPIEndPoint.getResults(searchTerm: name,
                                     parameters: nil) { result in
            switch result {
            case let .success(searchResults):
                artist = searchResults.map { itunesResult in
                    Artist(id: itunesResult.artistId,
                           name: itunesResult.artistName)
                }.first
                completion(artist ?? Artist(id: 1, name: ""))
            case let .failure(error):
                debugPrint(error.localizedDescription)
               return
            }
        }
    }
    
}
