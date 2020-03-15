//
//  MemberViewModel.swift
//  ITTest
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import Foundation

struct MemberViewModel {
    
    var id: String!
    var name: String!

    init(member: Member) {
        self.id = member.id
        self.name = member.name
    }
}
