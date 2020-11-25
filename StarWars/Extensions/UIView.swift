//
//  UIView.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

extension UIView {

  static var headerFooterBackground: UIView {
    let view = UIView()
    view.backgroundColor = .clear
    return view
  }
  
  static var roundedCornersContainer: UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.backgroundColor = UIColor.white.cgColor
    view.layer.cornerRadius = 16
    return view
  }

  func positionInCenter(as subview: UIView,
                        leadingInset: CGFloat = .zero,
                        topInset: CGFloat = .zero) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      subview.centerYAnchor.constraint(equalTo: centerYAnchor),
      subview.centerXAnchor.constraint(equalTo: centerXAnchor),
      subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingInset),
      subview.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: topInset)
    ])
  }

  func embedSubview(_ subview: UIView, with insets: UIEdgeInsets = .zero) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
      subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
      bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: insets.bottom),
      trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: insets.right)
    ])
  }

  func embedSubviewInSafeArea(_ subview: UIView, with insets: UIEdgeInsets = .zero) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      subview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: insets.left),
      subview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: insets.top),
      safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: insets.bottom),
      safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: insets.right)
    ])
  }

  func pinSubviewToTop(_ subview: UIView, with insets: UIEdgeInsets = .zero) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
      subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
      bottomAnchor.constraint(greaterThanOrEqualTo: subview.bottomAnchor, constant: insets.bottom),
      trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: insets.right)
    ])
  }

}
