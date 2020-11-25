//
//  SingleViewModel.swift
//  StarWars
//
//  Created by Alexander Sokhin on 24.11.2020.
//

import Foundation

class SingleViewModel {

  typealias Row = LineItemCell.Model

  struct Section {
    var title = ""
    var rows: [Row] = []

    var count: Int { return rows.count }
  }

  struct Model {
    var sections: [Section] = []
    var count: Int { return sections.count }
  }

  var model = Model()
}
