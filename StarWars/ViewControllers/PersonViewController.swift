//
//  PersonViewController.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

class PersonViewController: SingleViewController {
  var viewModel: PersonViewModel!

  override func configureTableView(){
    super.configureTableView()
    
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension PersonViewController: UITableViewDataSource {

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

extension PersonViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableViewHeader.reuseIdentifier) as! ProfileTableViewHeader
    header.title = viewModel.model.sections[section].title
    return header
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let section = self.viewModel.model.sections[indexPath.section]
    switch section.title {
    case "General info":
      return

    case "Vehicles":
      viewModel.showVehicle(with: self, at: indexPath.row)

    case "Homeworld":
      viewModel.showHomeworld(with: self)

    default:
      return
    }
  }
}
