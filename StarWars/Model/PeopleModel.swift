//
//  PeopleModel.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import Foundation

struct PeopleModel: Decodable {
    
    let name: String
    let height: String
    let mass: String
    let hair_color: String?
    let skin_color: String?
    let eye_color: String?
    let birth_year: String?
    let gender: String?
    let created: String?
}
