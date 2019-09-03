//
//  StarshipModel.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import Foundation

struct StarshipModel: Codable {
    
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: Double
    let length: Int
    let consumables: String
    let starship_class: String
    let mass: Int
    
}
