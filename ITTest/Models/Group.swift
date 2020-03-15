//
//  Group.swift
//  ITTest
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import Foundation

struct Group {
    
    var name: String!
    var members: [Member]!
    
    init(name: String, members: [Member]) {

        self.name = name
        self.members = members
    }
}
