//
//  PlanetViewController.swift
//  StarWars
//
//  Created by Alexander Sokhin on 15.11.2020.
//

import UIKit

class PlanetViewController: SingleViewController {
  var viewModel: PlanetViewModel!
    
    override func configureTableView(){
      super.configureTableView()
      
      tableView.dataSource = self
      tableView.delegate = self
    }
}

extension PlanetViewController: UITableViewDataSource, UITableViewDelegate {

  func numberOfSections(in tableView: UITableView) -> Int {
    self.viewModel.model.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.viewModel.model.sections[section].count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = LineItemCell()
    cell.model = viewModel.model.sections[indexPath.section].rows[indexPath.row]
    return cell
  }

}
