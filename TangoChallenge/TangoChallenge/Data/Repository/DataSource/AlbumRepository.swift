//
//  Repository.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import Foundation

enum InternetStatus{
    case online
    case offline
}

protocol AlbumsRepository{
    var networkStatus: InternetStatus { get set }
    func fetchAlbumList(from id: Int,
                        completion: @escaping ([Album]) -> Void)
}



final class DefaultAlbumsRepository: AlbumsRepository{
    
    var networkStatus: InternetStatus
    
    let itunesAPIEndPoint: iTunesAPI = iTunesAPI()
    
    init(){
        networkStatus = .online
    }
    
    public func fetchAlbumList(from id: Int, completion: @escaping ([Album]) -> Void) {
        switch networkStatus {
        case .online:
            loadRemote(from: id, completion: completion)
        case .offline:
            loadLocal(from: id)
        }
    }
    
    private func loadLocal(from ID: Int){
       
            let _ = Album(id: 1,
                  artistName: "AlgoExpert",
                  albumName: "AlgoExpert",
                  albumArtWork: "",
                  trackCount: 123,
                  releaseDate: "09-09-12",
                  price: 12.9,
                  urlReference: "httpts"
            )
    }
    
    private func loadRemote(from ID: Int, completion: @escaping ([Album]) -> Void) {
        
        var albums: [Album] = [Album]()
        
        itunesAPIEndPoint.lookup(id: 909253,
                                 parameters: ["limit" : "20",
                                              "entity" : "album"]) { result in
            
            switch(result){
            case .success(let searchResults):
                albums = searchResults.map { itunesResult in
                    Album(id: ID,
                          artistName: itunesResult.artistName,
                          albumName: itunesResult.collectionName ?? "",
                          albumArtWork: itunesResult.artworkUrl100?.absoluteString ?? "",
                          trackCount: itunesResult.trackCount ?? 0,
                          releaseDate: itunesResult.releaseDate ?? "",
                          price: itunesResult.collectionPrice ?? 0.0,
                          urlReference: itunesResult.collectionViewUrl ?? "")
                }
                albums.removeFirst()
                completion(albums)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                return
            }
            
        }
    }
    
}
