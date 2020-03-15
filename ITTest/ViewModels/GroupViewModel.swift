//
//  GroupViewModel.swift
//  ITTest
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import Foundation

struct GroupViewModel: Equatable {
    
    var name: String!
    var memberViewModels: [MemberViewModel]!

    init(group: Group) {
        self.name = group.name
        memberViewModels = [MemberViewModel]()
        for member in group.members {
            memberViewModels.append(MemberViewModel(member: member))
        }
    }

    mutating func sortby(type: SortType) {
        memberViewModels.sort { (lhs, rhs) -> Bool in
            if lhs.id.isEmpty && lhs.name.isEmpty { return false }
            if rhs.id.isEmpty && rhs.name.isEmpty { return true }
            return (type == .id) ? (lhs.id < rhs.id) : (lhs.name < rhs.name)
        }
    }
    
    static func == (lhs: GroupViewModel, rhs: GroupViewModel) -> Bool {
        return lhs.name == rhs.name
    }
}
