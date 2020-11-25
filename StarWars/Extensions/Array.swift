//
//  Array.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 11/11/2020.
//

import Foundation

extension Array {

  func makePositionForElement(at index: Int) -> RowPosition{
    let position: RowPosition
    if count == 1 {
      position = .single
    } else if index == .zero {
      position = .top
    } else if index + 1 == count {
      position = .bottom
    } else {
      position = .middle
    }
    return position
  }

}
