//
//  StarWarsPeopleModel.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import Foundation

struct StarWarsPeopleModel: Decodable {
    
    let count: Int
    let next: String?
    let previous: String?
    let results: [PeopleModel]    
}
