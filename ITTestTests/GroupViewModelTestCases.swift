//
//  GroupViewModelTestCases.swift
//  ITTestTests
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import XCTest
@testable import ITTest

class GroupViewModelTestCases: XCTestCase {

    func testGroupViewModelCreation() {
        
        let member1 = Member(id: "1", name: "Fahid")
        let member2 = Member(id: "5", name: "Apple")
        let member3 = Member(id: "2", name: "Shawn")
        let group = Group(name: "Testing", members: [member1, member2, member3])
        let groupViewModel = GroupViewModel(group: group)
        XCTAssertEqual(groupViewModel.name, "Testing")
        XCTAssertEqual(groupViewModel.memberViewModels.count, 3)
    }

    func testGroupViewModelSortingByName() {
        
        let member1 = Member(id: "1", name: "Fahid")
        let member2 = Member(id: "5", name: "Apple")
        let member3 = Member(id: "2", name: "Shawn")
        let member4 = Member(id: "", name: "")

        let group = Group(name: "Testing", members: [member1, member4, member2, member3])
        var groupViewModel = GroupViewModel(group: group)
        groupViewModel.sortby(type: SortType.name)
        
        XCTAssertEqual(groupViewModel.memberViewModels.first?.name, "Apple")
        XCTAssertEqual(groupViewModel.memberViewModels.last?.name, "")
    }

    func testGroupViewModelSortingByID() {
        
        let member1 = Member(id: "1", name: "Fahid")
        let member2 = Member(id: "5", name: "Apple")
        let member3 = Member(id: "2", name: "Shawn")
        let member4 = Member(id: "", name: "")

        let group = Group(name: "Testing", members: [member4, member1, member2, member3])
        var groupViewModel = GroupViewModel(group: group)
        groupViewModel.sortby(type: SortType.id)
        
        XCTAssertEqual(groupViewModel.memberViewModels.first?.id, "1")
        XCTAssertEqual(groupViewModel.memberViewModels[2].id, "5")
        XCTAssertNotEqual(groupViewModel.memberViewModels.last?.id, "2")
    }
}
