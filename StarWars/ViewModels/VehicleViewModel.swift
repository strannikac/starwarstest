//
//  VehicleViewModel.swift
//  StarWars
//
//  Created by Alexander Sokhin on 15.11.2020.
//

import Foundation

class VehicleViewModel: SingleViewModel {

  var vehicle: Vehicle! {
    didSet {
      model = makeModel()
    }
  }

  func makeModel() -> Model {
    var sections: [Section] = []
    let general = Section(title: "", rows: [
        .init(position: .middle, title: "Name", property: vehicle.name),
        .init(position: .top, title: "Model", property: vehicle.model),
        .init(position: .middle, title: "Manufacturer", property: vehicle.manufacturer),
        .init(position: .middle, title: "Class", property: vehicle.vehicleClass),
        .init(position: .middle, title: "Length", property: vehicle.length),
        .init(position: .bottom, title: "Max Atmosphering Speed", property: vehicle.maxAtmospheringSpeed),
        .init(position: .middle, title: "Cost In Credits", property: vehicle.costInCredits),
        .init(position: .middle, title: "Crew", property: vehicle.crew),
        .init(position: .middle, title: "Passengers", property: vehicle.passengers),
        .init(position: .middle, title: "Cargo Capacity", property: vehicle.cargoCapacity),
        .init(position: .middle, title: "Consumables", property: vehicle.consumables)
    ])
    sections.append(general)
    return .init(sections: sections)
  }
}
