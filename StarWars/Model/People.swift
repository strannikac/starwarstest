//
//  People.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import Foundation

// MARK: - People
class People: Codable {
  var count: Int
  var next: String?
  var previous: String?
  var results: [Person]
}
