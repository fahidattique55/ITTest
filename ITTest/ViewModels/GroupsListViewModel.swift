//
//  GroupsListViewModel.swift
//  ITTest
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import Foundation

enum SortType {
    case id, name
}

struct GroupsListViewModel {
    
    var groupViewModels: [GroupViewModel]!
    var numberOfSections: Int {
        return groupViewModels.count
    }
    var textForNextSortingType: String {
        return sortType == .id ? "Sort by name" : "Sort by id"
    }
    var sortType: SortType = .id {
        didSet {
            for index in 0..<groupViewModels.count {
                groupViewModels[index].sortby(type: sortType)
            }
        }
    }

    init(groups: [Group]) {
        self.groupViewModels = [GroupViewModel]()
        for group in groups {
            groupViewModels.append(GroupViewModel(group: group))
        }
    }
    
    func groupViewModel(at index: Int) -> GroupViewModel? {
        if index >= groupViewModels.count { return nil }
        return groupViewModels[index]
    }
    
    func memberViewModel(at indexPath: IndexPath) -> MemberViewModel? {
        guard let group = groupViewModel(at: indexPath.section) else { return nil }
        if indexPath.row >= group.memberViewModels.count { return nil }
        return group.memberViewModels[indexPath.row]
    }
    
    mutating func switchSortType() {
        if sortType == .id {
            sortType = .name
        }
        else {
            sortType = .id
        }
    }
}
