//
//  SearchAlbumViewController.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

final class AlbumListViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    //MARK: - Properties
    //TODO: Dependency Injector to avoid hardcoding dependencies, sorry for this time
    
    private let albumListViewModel = DefaultAlbumListViewModel(serchUseCase:
                                                               AlbumSearchUseCaseByArtist(
                                                                    artist: Artist(id: 909253,
                                                                                   name: "Jack Johnson"),
                                                                    
                                                                    repository: DefaultAlbumsRepository()
                                                                ))
    
    //MARK: - User Interface Elements
    
    let search = UISearchController(searchResultsController: nil)

    let collectionViewAlbums: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - Initial Configurations
    
    private func collectionViewConfiguration(){
        collectionViewAlbums.delegate   = self
        collectionViewAlbums.dataSource = self
        collectionViewAlbums.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionViewAlbums.addConstraintsToFillView(view: self.view, padding: 15)
    }
    
    private func viewConfiguration(){
        view.backgroundColor = .accent
        albumListViewModel.delegate = self
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        search.searchBar.tintColor = .complementAccent
    }
    
    //MARK: - Initializers
    init(title: String){
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfiguration()
        viewConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
//MARK: - CollectionViewDelegate
extension AlbumListViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        coordinator?.showAlbumDetails(albumDetailsViewModel:
                                        albumListViewModel.albumViewModel(at: indexPath.item,
                                                                          kind: AlbumViewModelType.detail) as! AlbumViewModelDetails)
    }
}

//MARK: - CollectionViewDataSource
extension AlbumListViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumListViewModel.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewAlbums.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier,
                                                                  for: indexPath) as? AlbumCell else {
            return UICollectionViewCell()
        }
        //MARK: Change color for Cell
        cell.backgroundColor = indexPath.item % 2 == 0 ? .accentSoft : .magnolia
        cell.albumViewModel = albumListViewModel.albumViewModel(at: indexPath.item, kind: AlbumViewModelType.cell) as! AlbumCellViewModel
        return cell
    }
}

extension AlbumListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice().userInterfaceIdiom == .phone {
            return CGSize(width: collectionView.frame.width, height: 70)
        }else{
            return CGSize(width: collectionView.frame.width/2.1, height: 70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
    }
}

extension AlbumListViewController: ViewModelDelegate{
    
    func callFinished() {
        collectionViewAlbums.reloadData()
    }
    
}
