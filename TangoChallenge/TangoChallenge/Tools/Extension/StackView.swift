//
//  StackView.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-29.
//

import UIKit

extension UIStackView{
    func addArrangedSubViews(views: [UIView]){
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
        }
    }
    
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis = .vertical,
                     distribution: UIStackView.Distribution = .fillProportionally,
                     spacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
}
