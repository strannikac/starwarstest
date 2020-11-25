//
//  PeopleService.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import Foundation

class PeopleService {
  private init(){}
  static let shared = PeopleService()
    
    private func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
              completionHandler(nil, response, error)
              return
            }
                
            if let object = try? newJSONDecoder().decode(T.self, from: data) {
                completionHandler(object, response, nil)
            } else {
                completionHandler(nil, response, error)
            }
        }
    }

  func people(at page: Int = 1, completion: @escaping (People?, Error?) -> ()) {
    let url = URL(string: "https://swapi.dev/api/people/?page=\(page)")!
    let task = self.codableTask(with: url) { people, response, error in
        completion(people, error)
    }
    task.resume()
  }
    
    func person(with id: Int, completion: @escaping (Person?, Error?) -> ()) {
      let url = URL(string: "https://swapi.dev/api/people/\(id)/")!
      let task = self.codableTask(with: url) { person, response, error in
        completion(person, error)
      }
      task.resume()
    }
    
    func vehicle(url: String, completion: @escaping (Vehicle?, Error?) -> ()) {
        if let url = URL(string: url) {
          let task = self.codableTask(with: url) { vehicle, response, error in
            completion(vehicle, error)
          }
          task.resume()
        }
    }
    
    func planet(url: String, completion: @escaping (Planet?, Error?) -> ()) {
        if let url = URL(string: url) {
          let task = self.codableTask(with: url) { planet, response, error in
              completion(planet, error)
          }
          task.resume()
        }
    }
}
