//
//  Planet.swift
//  StarWars
//
//  Created by Alexander Sokhin on 14.11.2020.
//

import Foundation

class Planet: Codable {
  var name, rotationPeriod, orbitalPeriod: String
  var diameter, climate, gravity, terrain: String
  var surfaceWater, population: String
  var residents, films: [String]
  var created, edited: String
  var url: String

  enum CodingKeys: String, CodingKey {
    case name
    case rotationPeriod = "rotation_period"
    case orbitalPeriod = "orbital_period"
    case diameter, climate, gravity, terrain
    case surfaceWater = "surface_water"
    case population, residents, films, created, edited, url
  }
}
