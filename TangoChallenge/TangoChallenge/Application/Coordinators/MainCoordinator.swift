//
//  MainCoordinator.swift
//  AlbumTango
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

protocol Coordinator {
    //var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

final class MainCoordinator: Coordinator{
    
    //var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Coordinator Routes
    func start() {
        let searchViewControlller = AlbumListViewController(title: "Home")
        searchViewControlller.coordinator = self
        navigationController.pushViewController(searchViewControlller, animated: true)
    }
    
    func showAlbumDetails(albumDetailsViewModel : AlbumViewModelDetails){
        let detailsViewController = AlbumDetailsViewController()
        detailsViewController.albumViewModel = albumDetailsViewModel
        detailsViewController.coordinator = self
        navigationController.present(detailsViewController, animated: true)
    }
    
}
