//
//  ProfileTableViewHeader.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 11/11/2020.
//

import UIKit

final class ProfileTableViewHeader: UITableViewHeaderFooterView {

  // MARK: - Internal properties

  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }

  // MARK: - Private properties

    private var titleLabel: UILabel = UILabel()

  // MARK: - Init

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    configureUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private methods

  private func configureUI() {
    titleLabel.setFont(isBold: true, size: 22)
    
    translatesAutoresizingMaskIntoConstraints = false
    backgroundView = .headerFooterBackground

    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 1
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.embedSubview(titleLabel, with: .containerViewInsets)
  }

}

