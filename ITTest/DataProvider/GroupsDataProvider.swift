//
//  GroupsDataProvider.swift
//  ITTest
//
//  Created by Fahad Attique on 15/03/2020.
//  Copyright © 2020 Fahad Attique. All rights reserved.
//

import Foundation

class GroupsDataProvider {
    
    static func getGroups() -> [Group] {
        
        let shiro = Member(id: "1", name: "Shiro")
        let wakaba = Member(id: "3", name: "Wakaba")
        let fahid = Member(id: "2", name: "Fahid")
        let emptyData1 = Member(id: "", name: "")
        let group1 = Group(name: "1", members: [wakaba, emptyData1, shiro, fahid])

        let lina = Member(id: "5", name: "Lina")
        let Rin = Member(id: "4", name: "Rin")
        let josh = Member(id: "8", name: "Jin")
        let emptyData2 = Member(id: "", name: "")
        let group2 = Group(name: "2", members: [Rin, emptyData2, lina, josh])
        
        return [group1, group2]
    }
}
