//
//  UIStackView.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

extension UIStackView {

  static var hStack: UIStackView {
    let stack = UIStackView()
    stack.spacing = .hStackSpacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }

  static var hStackCentered: UIStackView {
    let stack = UIStackView()
    stack.alignment = .center
    stack.distribution = .equalCentering
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }

  static var vStack: UIStackView {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = .vStackSpacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }

}

// MARK: - Helper

extension CGFloat {

  fileprivate static var vStackSpacing: CGFloat { 12 }

  fileprivate static var hStackWidth: CGFloat { 295 }
  fileprivate static var hStackHeight: CGFloat { 32 }

  fileprivate static var hStackSpacing: CGFloat { 11 }

}
