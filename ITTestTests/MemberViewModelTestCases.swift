//
//  MemberViewModelTestCases.swift
//  ITTestTests
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import XCTest
@testable import ITTest

class MemberViewModelTestCases: XCTestCase {

    func testMemberViewModelCreation() {
        
        let member = Member(id: "1", name: "Fahid")
        let memberFahid = MemberViewModel(member: member)
        XCTAssertEqual(memberFahid.name, "Fahid")
    }
}
