//
//  UIStackView + Extensions.swift
//  ITEALprojects
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

extension UIStackView {
    convenience init (arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat){
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = .fillEqually
        self.spacing = spacing
    }
    
}
