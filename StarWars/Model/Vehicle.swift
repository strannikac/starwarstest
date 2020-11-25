//
//  Vehicle.swift
//  StarWars
//
//  Created by Alexander Sokhin on 14.11.2020.
//

import Foundation

class Vehicle: Codable {
  var name, model, manufacturer: String
  var costInCredits, length, maxAtmospheringSpeed: String
  var crew, passengers, cargoCapacity, consumables, vehicleClass: String
  var pilots, films: [String]
  var created, edited: String
  var url: String

  enum CodingKeys: String, CodingKey {
    case name, model, manufacturer
    case costInCredits = "cost_in_credits"
    case length
    case maxAtmospheringSpeed = "max_atmosphering_speed"
    case crew, passengers
    case cargoCapacity = "cargo_capacity"
    case consumables
    case vehicleClass = "vehicle_class"
    case pilots, films, created, edited, url
  }
}
