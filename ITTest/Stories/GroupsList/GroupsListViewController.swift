//
//  GroupsListViewController.swift
//  ITTest
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import UIKit

class GroupsListViewController: UIViewController {

    //  MARK:- IBOutlets
    
    @IBOutlet weak var groupsTableView: UITableView!
    @IBOutlet weak var sortingBarItem: UIBarButtonItem!
    
    //  MARK:- Class Properties
    
    var groupsListViewModel = GroupsListViewModel(groups: GroupsDataProvider.getGroups())
    
    //  MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }

    //  MARK:- Functions

    func configureView() {
        
        groupsTableView.registerNib(from: MemberTableViewCell.self)
        groupsTableView.estimatedRowHeight = 44
        groupsTableView.rowHeight = UITableView.automaticDimension
        groupsTableView.reloadData()
        sortingBarItem.title = groupsListViewModel.textForNextSortingType
    }
    
    //  MARK:- IBActions
    
    @IBAction func switchSortingOrder(_ sender: Any) {
        
        groupsListViewModel.switchSortType()
        sortingBarItem.title = groupsListViewModel.textForNextSortingType
        groupsTableView.reloadData()
    }
}

extension GroupsListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return groupsListViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let groupViewModel = groupsListViewModel.groupViewModel(at: section) else { return 0 }
        return groupViewModel.memberViewModels.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let groupViewModel = groupsListViewModel.groupViewModel(at: section) else { return "" }
        return "Group " + groupViewModel.name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: MemberTableViewCell = tableView.dequeue(cell: MemberTableViewCell.self) else { return UITableViewCell() }
        guard let memberViewModel = groupsListViewModel.memberViewModel(at:indexPath) else { return cell }
        cell.configure(memberViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
