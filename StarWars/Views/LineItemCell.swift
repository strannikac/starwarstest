//
//  LineItemCell.swift
//  StarWars
//
//  Created by Alexander Sokhin on 24.11.2020.
//

import UIKit

class LineItemCell: UITableViewCell {
  
  // MARK: - Internal types

    struct Model: Positionable {
      var position: RowPosition = .single
      var title = ""
      var property = ""
    }

  // MARK: - Internal properties

  var model = Model() {
    didSet {
      handleModel()
    }
  }

  // MARK: - Private properties

  // Container view

  let containerView: UIView = .roundedCornersContainer

  lazy var containerStackTopConstraint: NSLayoutConstraint = containerStack.topAnchor.constraint(equalTo: containerView.topAnchor)
  lazy var containerStackLeadingConstraint: NSLayoutConstraint = containerStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
  lazy var containerStackBottomConstraint: NSLayoutConstraint = containerView.bottomAnchor.constraint(equalTo: containerStack.bottomAnchor)
  lazy var containerStackTrailingConstraint: NSLayoutConstraint = containerView.trailingAnchor.constraint(equalTo: containerStack.trailingAnchor)

  // Container stack

 
    var containerStack: UIStackView = .hStack
    var propertyLabel: UILabel = UILabel()
    var titleLabel: UILabel = UILabel()

  // MARK: - Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
    handleModel()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - common methods

  func configureUI() {
    backgroundColor = .clear
    selectionStyle = .none
    
    propertyLabel.setFont(isBold: true)
    titleLabel.setFont()

    configureSubviews()
    configureContainerView()
    configureContainerStackPosition()

    configureContainerStack()
  }
    
    func configureContainerView() {
      contentView.embedSubview(containerView, with: .lineItemInsets)
    }

  func configureContainerStackPosition() {
    containerStack.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(containerStack)
    containerView.addConstraints([
      containerStackTopConstraint,
      containerStackBottomConstraint,
      containerStackLeadingConstraint,
      containerStackTrailingConstraint
    ])
  }

  func configureContainerStack() {
    containerStack.addArrangedSubview(titleLabel)
    containerStack.addArrangedSubview(propertyLabel)
  }
    
    func configureSubviews() {
      titleLabel.numberOfLines = 1
      titleLabel.textAlignment = .left
      propertyLabel.numberOfLines = 1
      propertyLabel.textAlignment = .right
    }
    
    func handleModel() {
      updateContainerView()
      titleLabel.text = model.title
      propertyLabel.text = model.property
    }

  func updateContainerView() {
    let insets: UIEdgeInsets = model.toInsets
    containerStackTopConstraint.constant = insets.top
    containerStackBottomConstraint.constant = insets.bottom
    containerStackLeadingConstraint.constant = insets.left
    containerStackTrailingConstraint.constant = insets.right

    containerView.layer.maskedCorners = model.toMaskedCorners
  }

}
