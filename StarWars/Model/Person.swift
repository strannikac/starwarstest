//
//  Person.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import Foundation

class Person: Codable {
  var name, height, mass, hairColor: String
  var skinColor, eyeColor, birthYear: String
  var gender: Gender
  var homeworld: String
  var films, species, vehicles, starships: [String]
  var created, edited: String
  var url: String

  enum CodingKeys: String, CodingKey {
    case name, height, mass
    case hairColor = "hair_color"
    case skinColor = "skin_color"
    case eyeColor = "eye_color"
    case birthYear = "birth_year"
    case gender, homeworld, films, species, vehicles, starships, created, edited, url
  }
}
