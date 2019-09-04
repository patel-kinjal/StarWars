//
//  StarWarsPeopleViewModel.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import Foundation

struct StarWarsPeopleViewModel {
    
    let count: Int
    let next: String
    let previous: String
    var peopleData = [PeopleModel]()
    
    init(people: StarWarsPeopleModel) {
        self.count = people.count
        self.next = people.next ?? ""
        self.previous = people.previous ?? ""
        self.peopleData = people.results
    }
    
}
