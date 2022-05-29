//
//  UIView+Contraints.swift
//  iOSChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-27.
//

import UIKit


// MARK: Constraints for Programmatic Views on UIKit
/// Thes

extension UIView {
    
    func anchor(parent: UIView,
                top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
        
        parent.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let activeTop = top {
            topAnchor.constraint(equalTo: activeTop, constant: paddingTop).isActive = true
        }
        
        if let activeLeft = left {
            leftAnchor.constraint(equalTo: activeLeft, constant: paddingLeft).isActive = true
        }
        
        if let activeBottom = bottom {
            bottomAnchor.constraint(equalTo: activeBottom, constant: -paddingBottom).isActive = true
        }
        
        if let activeRight = right {
            rightAnchor.constraint(equalTo: activeRight, constant: -paddingRight).isActive = true
        }
        
        if let activeWidth = width {
            widthAnchor.constraint(equalToConstant: activeWidth).isActive = true
        }
        
        if let activeHeight = height {
            heightAnchor.constraint(equalToConstant: activeHeight).isActive = true
        }
    }
    
    func setSize(width: CGFloat?,
                 height: CGFloat?){
        if let activeWidth = width {
            widthAnchor.constraint(equalToConstant: activeWidth).isActive = true
        }
        
        if let activeHeight = height {
            heightAnchor.constraint(equalToConstant: activeHeight).isActive = true
        }
    }
    
    func addConstraintsToFillView(view: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(parent: view,
               top:     view.topAnchor,
               left:    view.safeAreaLayoutGuide.leftAnchor,
               bottom:  view.bottomAnchor,
               right:   view.safeAreaLayoutGuide.rightAnchor,
               paddingLeft: padding,
               paddingRight: padding
            )
    }
}
