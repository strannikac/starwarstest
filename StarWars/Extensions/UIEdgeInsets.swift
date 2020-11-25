//
//  UIEdgeInsets.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

extension UIEdgeInsets {

  static var containerInsets: UIEdgeInsets {
    return UIEdgeInsets(top: .containerTopInset,
                        left: .containerSideInset,
                        bottom: .containerBottomInset,
                        right: .containerSideInset)
  }

  static var containerViewInsets: UIEdgeInsets {
    return UIEdgeInsets(top: .zero,
                        left: .horizontalSpacing,
                        bottom: .zero,
                        right: .horizontalSpacing)
  }


  static var lineItemInsets: UIEdgeInsets {
    return UIEdgeInsets(top: .containerTopInset,
                        left: .lineItemSideInset,
                        bottom: .containerBottomInset,
                        right: .lineItemSideInset)
  }

  static var regularInsets: UIEdgeInsets {
    return UIEdgeInsets(top: .inset,
                        left: .inset,
                        bottom: .inset,
                        right: .inset)
  }

  static var topInset: UIEdgeInsets {
    return UIEdgeInsets(top: .inset,
                        left: .zero,
                        bottom: .zero,
                        right: .zero)
  }

}

extension CGFloat {

  fileprivate static var inset: CGFloat { 24 }

  fileprivate static var horizontalSpacing: CGFloat { 21 }
  fileprivate static var containerSideInset: CGFloat { 16 }
  fileprivate static var lineItemSideInset: CGFloat { .zero }
  fileprivate static var containerTopInset: CGFloat { .zero }
  fileprivate static var containerBottomInset: CGFloat { 1 }

}
