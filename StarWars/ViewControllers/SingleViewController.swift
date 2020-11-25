//
//  SingleViewController.swift
//  StarWars
//
//  Created by Dmitriy Roytman on 10/11/2020.
//

import UIKit

class SingleViewController: UIViewController {

    var container: UIView = .roundedCornersContainer
    var tableView = UITableView()
    
    var estimatedRowHeight: CGFloat { 72 }
    var footerHeight: CGFloat { 28 }
    var emptyHeaderHeight: CGFloat { 16 }
    var fullHeaderHeight: CGFloat { 40 }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
      updateUI()
    }

    func configureUI() {
      view.embedSubview(tableView, with: .regularInsets)
      view.backgroundColor = .white
      configureTableView()
    }

    func updateUI() {
      tableView.reloadData()
    }

    func configureTableView(){
      tableView.register(LineItemCell.self, forCellReuseIdentifier: LineItemCell.reuseIdentifier)
      tableView.register(ProfileTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ProfileTableViewHeader.reuseIdentifier)

        tableView.estimatedRowHeight = estimatedRowHeight
      tableView.rowHeight = UITableView.automaticDimension
      tableView.sectionHeaderHeight = UITableView.automaticDimension
      tableView.estimatedSectionHeaderHeight = fullHeaderHeight

      tableView.separatorStyle = .singleLine

      tableView.allowsSelection = true

      tableView.sectionHeaderHeight = fullHeaderHeight
      tableView.sectionFooterHeight = footerHeight

      tableView.bounces = false
    }
}
