//
//  AlbumListViewController+SearchBar.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-29.
//

import UIKit

extension AlbumListViewController: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension AlbumListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            //self.searchText = ""
            //isFiltered = false
            //self.tableView.reloadData()
            return
        }
        //self.searchText = searchText
        //isFiltered = true
        //self.tableView.reloadData()
    }
}
