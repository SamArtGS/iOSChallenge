//
//  SearchAlbumViewModel.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

protocol AlbumListViewModel{
    var albums: [Album]                 { get }
    var useCase: SearchAlbumsUseCase    { get }
    func albumViewModel(at index: Int, kind: AlbumViewModelType) -> AlbumViewModel
}

protocol ViewModelDelegate: AnyObject{
    func callFinished()
}

enum AlbumViewModelType{
    case cell
    case detail
}

class DefaultAlbumListViewModel : AlbumListViewModel{
    
    weak var delegate: ViewModelDelegate?
    var albums: [Album] = [Album]()
    var useCase: SearchAlbumsUseCase
    
    func albumViewModel(at index: Int, kind: AlbumViewModelType) -> AlbumViewModel {
        switch kind {
        case .cell:
            return AlbumCellViewModel(album: albums[index])
        case .detail:
            return AlbumDetailsViewModel(album: albums[index])
        }
        
    }
    
    init(serchUseCase: SearchAlbumsUseCase) {
        self.useCase = serchUseCase
        
        useCase.execute(completion: { [ weak self ] albums in
            self?.albums = albums
            self?.delegate?.callFinished()
        })
    }
}
