//
//  UILabel.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

extension UILabel {
    
    func setFont(isBold: Bool = false, size: CGFloat = 16, color: UIColor = .black) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        textColor = color
        
        if isBold {
            font = .boldSystemFont(ofSize: size)
        } else {
            font = .systemFont(ofSize: size)
        }
        
        lineBreakMode = .byWordWrapping
        numberOfLines = .zero
    }
}
