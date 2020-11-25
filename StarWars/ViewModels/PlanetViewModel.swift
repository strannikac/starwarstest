//
//  PlanetViewModel.swift
//  StarWars
//
//  Created by Alexander Sokhin on 15.11.2020.
//

import Foundation

class PlanetViewModel: SingleViewModel {

  var homeworld: Planet! {
    didSet {
      model = makeModel()
    }
  }
    
  func makeModel() -> Model {
    var sections: [Section] = []
    let general = Section(title: "", rows: [
        .init(position: .middle, title: "Name", property: homeworld.name),
        .init(position: .middle, title: "Diameter", property: homeworld.diameter),
        .init(position: .middle, title: "Climate", property: homeworld.climate),
        .init(position: .top, title: "Rotation Period", property: homeworld.rotationPeriod),
        .init(position: .middle, title: "Orbital Period", property: homeworld.orbitalPeriod),
        .init(position: .bottom, title: "Gravity", property: homeworld.gravity),
        .init(position: .middle, title: "Terrain", property: homeworld.terrain),
        .init(position: .middle, title: "Population", property: homeworld.population),
        .init(position: .middle, title: "Surface Water", property: homeworld.surfaceWater)
    ])
    sections.append(general)
    return .init(sections: sections)
  }
}
