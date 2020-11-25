//
//  PeopleViewModel.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import Foundation
import UIKit

class PeopleViewModel {

  var sections: Int { 1 }
    var rows: Int = 0
  var people: People!
  var personViewModel: PersonViewModel!
  var tableView: UITableView!
    
    private var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    private var vehicles: [Vehicle?] = []
    
    private var pages = 1
    private var perPage = 10
    private var currPage = 0
    private var isLoading = false

  init() {
    getPersons()
  }

  func configure(cell: UITableViewCell, at row: Int) {
    if row >= 0 && row < rows {
        if row == rows-1 {
            getPersons()
        }
        
        let peopleCell = cell as! PeopleTableViewCell
        let position: RowPosition
        if rows == 1 {
          position = .single
        } else if row == .zero {
          position = .top
        } else if rows == row + 1 {
          position = .bottom
        } else {
          position = .middle
        }
        peopleCell.model = .init(position: position,
                                 title: people.results[row].name,
                                 property: people.results[row].hairColor)
    }
  }
    
    private func getPersons() {
        currPage += 1
        
        if !isLoading && currPage <= pages {
            isLoading = true
            
            PeopleService.shared.people(at: currPage) { object, error in
                if let object = object {
                    if self.currPage == 1 {
                        self.people = object
                        self.personViewModel = PersonViewModel()
                        self.pages = Int(ceil(Double(self.people.count) / Double(self.perPage)))
                    } else {
                        self.people.results += object.results
                    }
                    
                    self.rows = self.people.results.count
                    self.isLoading = false
                    
                    DispatchQueue.main.sync {
                        self.tableView!.reloadData()
                    }
                } else {
                    //error
                }
            }
        }
    }
    
    func showPersonVC(with vc: PeopleViewController, at row: Int) {
        setActivityIndicator(with: vc, show: false)
        removeActivityIndicator()
        
        DispatchQueue.main.sync {
            for i in 0..<vehicles.count {
                if let item = vehicles[i] {
                    personViewModel.vehicles.append(item)
                }
            }
            
            let person = PersonViewController()
            person.viewModel = personViewModel
            person.viewModel.person = people.results[row]
        
            vc.present(person, animated: true)
        }
    }

    //prepare data for person controller (vehicles, homeworld)
  func showPerson(with vc: PeopleViewController, at row: Int) {
    var count = people.results[row].vehicles.count
    var countResult = 0
    
    for _ in 0..<count {
        vehicles.append(nil)
    }
    
    createActivityIndicator(with: vc)
    
    if people.results[row].homeworld != "" {
        count += 1
        
        //get homeworld
        PeopleService.shared.planet(url: people.results[row].homeworld) { object,  error in
            countResult += 1
            
            if let object = object {
                self.personViewModel.homeworld = object
            }
            
            if countResult >= count {
                self.showPersonVC(with: vc, at: row)
            }
        }
    }
    
    //get vehicles
    for i in 0..<people.results[row].vehicles.count {
        PeopleService.shared.vehicle(url: people.results[row].vehicles[i]) { object,  error in
            countResult += 1
            
            if let object = object {
                self.vehicles[i] = object
            }
            
            if countResult >= count {
                self.showPersonVC(with: vc, at: row)
            }
        }
    }
  }
    
    // MARK: activity indicator
    
    //create activity indicator in controller
    func createActivityIndicator(with vc: PeopleViewController) {
        DispatchQueue.main.async {
            let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
            vc.view.addSubview(indicator)
            
            indicator.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            indicator.color = .red
            indicator.style = .large
            
            indicator.translatesAutoresizingMaskIntoConstraints = false
            
            let width = vc.view.bounds.size.width
            let height = vc.view.bounds.size.height
            
            indicator.widthAnchor.constraint(equalToConstant: width).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: height).isActive = true
            
            indicator.hidesWhenStopped = true
            indicator.center = vc.view.center
            
            self.activityIndicatorView = indicator
            
            self.setActivityIndicator(with: vc, show: true)
        }
    }
    
    //show or hide activity indicator
    func setActivityIndicator(with vc: PeopleViewController, show: Bool) {
        DispatchQueue.main.async {
            self.activityIndicatorView.isHidden = !show
            vc.view.isUserInteractionEnabled = !show
            
            if show {
                self.activityIndicatorView.startAnimating()
            } else {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    func removeActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicatorView.removeFromSuperview()
        }
    }
}
