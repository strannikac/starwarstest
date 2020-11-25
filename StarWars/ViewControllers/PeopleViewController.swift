//
//  PeopleViewController.swift
//  StarWars
//
//  Created by Alexander Sokhin on 24.11.2020.
//

import UIKit

class PeopleViewController: UIViewController {

  var viewModel = PeopleViewModel()
  var tableView = UITableView()
    
    fileprivate var estimatedRowHeight: CGFloat { 72 }

    fileprivate var footerHeight: CGFloat { 28 }
    fileprivate var emptyHeaderHeight: CGFloat { 16 }
    fileprivate var fullHeaderHeight: CGFloat { 40 }

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.tableView = self.tableView
    configureUI()
  }

  private func configureUI() {
    self.view.embedSubview(tableView)
    view.backgroundColor = .lightGray
    title = "Star Wars"

    tableView.contentInset = .topInset
    tableView.backgroundColor = .clear
    tableView.backgroundView?.backgroundColor = .clear
    configureTableView()
  }

  private func configureTableView(){
    tableView.register(PeopleTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell.reuseIdentifier")

    tableView.dataSource = self
    tableView.delegate = self

    tableView.estimatedRowHeight = estimatedRowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.sectionHeaderHeight = UITableView.automaticDimension
    tableView.estimatedSectionHeaderHeight = fullHeaderHeight

    tableView.separatorStyle = .none

    tableView.allowsSelection = true

    tableView.sectionHeaderHeight = emptyHeaderHeight
    tableView.sectionFooterHeight = footerHeight

    tableView.bounces = false
  }
}

extension PeopleViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.viewModel.rows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = PeopleTableViewCell()
    self.viewModel.configure(cell: cell, at: indexPath.item)
    return cell
  }

}

extension PeopleViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.viewModel.showPerson(with: self, at: indexPath.row)
  }
}
