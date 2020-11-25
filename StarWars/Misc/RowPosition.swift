//
//  RowPosition.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

enum RowPosition {
  case top
  case middle
  case bottom
  case single
}

protocol Positionable {
  var position: RowPosition { get }
}

extension Positionable {

  var toInsets: UIEdgeInsets {
    switch position {
    case .single,
         .top:
      return .regularInsets

    case .bottom,
         .middle:
      return .regularInsets
    }
  }

  var toMaskedCorners: CACornerMask {
    switch position {
    case .single:
      return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]

    case .top:
      return [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    case .bottom:
      return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

    case .middle:
      return []
    }
  }

}

