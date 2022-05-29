//
//  AlbumDetailsViewController.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

final class AlbumDetailsViewController: UIViewController{
    
    weak var coordinator: MainCoordinator?
    
    public var albumViewModel: AlbumViewModelDetails? {
        didSet{ configureViewModel() }
    }
    
    //MARK: - User Interface Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .complementAccent
        label.numberOfLines = 0
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .complementAccent
        label.numberOfLines = 0
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private let numberSongsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .complementAccent
        label.numberOfLines = 0
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .complementAccent
        label.numberOfLines = 0
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .complementAccent
        label.numberOfLines = 0
        label.textAlignment = .left
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private let externalLinkButton:UIButton = {
        let boton = UIButton(type: .system)
        boton.setBackgroundColor(.usafaBlue, for: .normal)
        boton.setBackgroundColor(.usafaBlue, for: .selected)
        boton.setTitleColor(.white, for: .normal)
        boton.setTitleColor(.white, for: .highlighted)
        boton.layer.cornerRadius = 15
        boton.setTitle(NSLocalizedString("search", comment: ""), for: .normal)
        boton.isUserInteractionEnabled = true
        boton.clipsToBounds = true
        boton.contentMode = .scaleAspectFit
        return boton
    }()
    
    private let closeButton:UIButton = {
        let boton = UIButton(type: .close)
        boton.isUserInteractionEnabled = true
        boton.clipsToBounds = true
        boton.contentMode = .scaleAspectFit
        return boton
    }()
    
    //MARK: - Initial Configurations
    
    private func viewConfiguration(){
        view.backgroundColor = .accent
        albumImageView.setSize(width: 150,
                               height: 150)
        
        let stackTitles = UIStackView(arrangedSubviews: [titleLabel,
                                                         artistLabel,
                                                         releaseDateLabel],
                                      distribution: .fillProportionally)
        stackTitles.alignment = .leading
        let stackImageTitles = UIStackView(arrangedSubviews: [albumImageView,
                                                              stackTitles],
                                           axis: .horizontal,
                                           distribution: .fillProportionally, spacing: 10)
        
        let stackMain = UIStackView(arrangedSubviews: [stackImageTitles,
                                                       numberSongsLabel,
                                                       priceLabel, UIView(),
                                                       externalLinkButton], distribution: .fill, spacing: 10)
        closeButton.anchor(parent: self.view,
                     top: self.view.safeAreaLayoutGuide.topAnchor,
                     right: self.view.safeAreaLayoutGuide.rightAnchor,
                     paddingTop: 10,
                     paddingRight: 10,
                     width: 30,
                     height: 30
        )
        stackMain.anchor(parent: self.view,
                     top: self.closeButton.bottomAnchor,
                     left: self.view.safeAreaLayoutGuide.leftAnchor,
                     bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                     right: self.view.safeAreaLayoutGuide.rightAnchor,
                     paddingTop: 15,
                     paddingLeft: 10,
                     paddingBottom: 10,
                     paddingRight: 10
        )
        numberSongsLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                                 multiplier: 0.10).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                           multiplier: 0.10).isActive = true
        externalLinkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        externalLinkButton.addTarget(self, action: #selector(openSafari), for: .touchUpInside)
        
        closeButton.addTarget(self, action: #selector(closeSelector),
                              for: .touchUpInside)
    }
    
    private func configureViewModel() {
        guard let albumViewModel        = albumViewModel else { return }
        titleLabel.attributedText       = albumViewModel.title
        artistLabel.attributedText      = albumViewModel.artist
        numberSongsLabel.attributedText = albumViewModel.numberSongs
        
        releaseDateLabel.attributedText = albumViewModel.releaseDate
        priceLabel.attributedText       = albumViewModel.price
        
        if let urlAlbum = albumViewModel.imageAlbum{
            albumImageView.load(url: urlAlbum)
        }else {
            albumImageView.image = UIImage(named: "AlbumPreview")
        }
        
        viewConfiguration()
    }
    
    //MARK: - Initializers
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Selectors
    
    @objc func closeSelector(){
        coordinator?.navigationController.dismiss(animated: true,
                                                  completion: nil)
    }
    
    @objc func openSafari(){
        if let url = URL(string: albumViewModel?.model.urlReference ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

