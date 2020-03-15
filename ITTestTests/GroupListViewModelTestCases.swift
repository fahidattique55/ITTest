//
//  GroupListViewModelTestCases.swift
//  ITTestTests
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import XCTest
@testable import ITTest

class GroupListViewModelTestCases: XCTestCase {

    func testGroupListViewModelCreation() {
        
        let groups = GroupsDataProvider.getGroups()
        var groupsListViewModel = GroupsListViewModel(groups: groups)
        
        XCTAssertEqual(groupsListViewModel.numberOfSections, 2)
        XCTAssertEqual(groupsListViewModel.sortType, .id)
        XCTAssertEqual(groupsListViewModel.groupViewModel(at: 4), nil)
        XCTAssertEqual(groupsListViewModel.groupViewModel(at: 4), nil)
        XCTAssertEqual(groupsListViewModel.groupViewModel(at: 0)?.memberViewModels.first?.name, "Wakaba")
        
        groupsListViewModel.switchSortType()
        XCTAssertEqual(groupsListViewModel.sortType, .name)
    }
}
