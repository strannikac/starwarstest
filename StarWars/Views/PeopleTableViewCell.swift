//
//  PeopleTableViewCell.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

class PeopleTableViewCell: LineItemCell {
    
    override func configureContainerView() {
      contentView.embedSubview(containerView, with: .containerInsets)
    }
    
    override func configureSubviews() {
        containerStack = .vStack
        
      titleLabel.numberOfLines = 1
      propertyLabel.textAlignment = .left
    }
    
    override func configureContainerStack() {
        super.configureContainerStack()

        containerStack.addConstraints([
            containerStack.widthAnchor.constraint(equalTo: propertyLabel.widthAnchor),
            containerStack.widthAnchor.constraint(equalTo: titleLabel.widthAnchor)
        ])
    }
}
