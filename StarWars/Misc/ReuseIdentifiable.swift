//
//  ReuseIdentifiable.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 11/11/2020.
//

import UIKit

// MARK: - Reuse Identifiable

protocol ReuseIdentifiable {

  static var reuseIdentifier: String { get }

}

extension ReuseIdentifiable {

  static var reuseIdentifier: String {
    return String(describing: self)
  }

}

// MARK: - UITableViewCell & UICollectionViewCell

extension UITableViewCell: ReuseIdentifiable {}
extension UITableViewHeaderFooterView: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}

