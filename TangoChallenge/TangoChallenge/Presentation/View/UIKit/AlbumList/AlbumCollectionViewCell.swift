//
//  AlbumCollectionViewCell.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

class AlbumCell: UICollectionViewCell{
    
    static let identifier = String(describing: self)
    
    public var albumViewModel: AlbumViewModel? {
        didSet { configureViewModel() }
    }
    
    //MARK: - User Interface Elements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    let numberSongsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    private var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let stackView: UIStackView = {
       let stackView:UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configurations
    private func configureUserInterface() {
        clipsToBounds = true
        self.layer.cornerRadius = 15
        
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(artistLabel)
        
        titleLabel.anchor(parent: stackView, paddingTop: 5)
        artistLabel.anchor(parent: stackView, paddingBottom: 5)
        
        let stack = UIStackView(arrangedSubviews: [albumImageView, stackView],
                                axis: .horizontal, distribution: .fill, spacing: 10)
        
        stack.anchor(parent:    self,
                     top:       self.topAnchor,
                     left:      self.leftAnchor,
                     bottom:    self.bottomAnchor,
                     right:     self.rightAnchor
        )
        albumImageView.anchor(parent: stack,
                              width: frame.height)
    }
    
    private func configureViewModel() {
        guard let albumViewModel = albumViewModel else { return }
        titleLabel.attributedText       = albumViewModel.title
        artistLabel.attributedText      = albumViewModel.artist
        numberSongsLabel.attributedText = albumViewModel.numberSongs
        
        if let urlAlbum = albumViewModel.imageAlbum{
            albumImageView.load(url: urlAlbum)
        }else {
            albumImageView.image = UIImage(named: "AlbumPreview")
        }

        
    }
}
