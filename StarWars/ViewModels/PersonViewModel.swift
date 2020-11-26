//
//  PersonViewModel.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import Foundation

class PersonViewModel: SingleViewModel {

  var person: Person! {
    didSet {
      model = makeModel()
    }
  }
    
    //vehicles
    var vehicles: [Vehicle] = []
    
    //homeworld
    var homeworld: Planet!

  func makeModel() -> Model {
    var sections: [Section] = []
    let general = Section(title: "General info", rows: [
      .init(position: .top, title: "Mass", property: person.mass),
      .init(position: .middle, title: "Height", property: person.height),
      .init(position: .middle, title: "Hair Color", property: person.hairColor),
      .init(position: .middle, title: "Name", property: person.name),
      .init(position: .middle, title: "Skin Color", property: person.skinColor),
      .init(position: .middle, title: "Eye Color", property: person.eyeColor),
      .init(position: .bottom, title: "Gender", property: person.gender)
    ])
    sections.append(general)
    
    var homeworldName = person.homeworld
    if let item = self.homeworld {
        homeworldName = item.name
    }

    let homeworld = Section(title: "Homeworld", rows: [
        .init(position: .single, title: "homeworld", property: homeworldName)
    ])
    sections.append(homeworld)

    if !person.vehicles.isEmpty {
      sections.append(makeVehicles())
    }
    return .init(sections: sections)
  }

  func makeVehicles() -> Section {
    var rows: [Row] = []
    for (index, vehicle) in person.vehicles.enumerated() {
      let position = person.vehicles.makePositionForElement(at: index)
        
        var vehicleName = vehicle
        if vehicles.count > index {
            vehicleName = vehicles[index].name
        }
        rows.append(.init(position: position, title: "Vehicle", property: vehicleName))
    }
    return Section(title: "Vehicles", rows: rows)
  }

  func showVehicle(with vc: PersonViewController, at row: Int) {
    // TODO: - Implement
    let vehicleVC = VehicleViewController()
    vehicleVC.viewModel = VehicleViewModel()
    vehicleVC.viewModel.vehicle = vehicles[row]

    vc.present(vehicleVC, animated: true)
  }

  func showHomeworld(with vc: PersonViewController) {
    // TODO: - Implement
    let planetVC = PlanetViewController()
    planetVC.viewModel = PlanetViewModel()
    planetVC.viewModel.homeworld = homeworld

    vc.present(planetVC, animated: true)
  }

}
