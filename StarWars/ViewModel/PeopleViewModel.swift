//
//  PeopleViewModel.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import Foundation
struct PeopleViewModel {
    
    let name: String
    let height: String
    let mass: String
    let hair_color: String?
    let skin_color: String?
    let eye_color: String?
    let birth_year: String?
    let gender: String?
    let created: String?
    
    // var people: PeopleModel?

    init(people: PeopleModel) {
        self.name = people.name
        self.height = people.height
        self.mass = people.mass
        self.hair_color = people.hair_color
        self.skin_color = people.skin_color
        self.eye_color = people.eye_color
        self.birth_year = people.birth_year
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        if let date = formatter.date(from: people.created!) {
            formatter.dateFormat = "MM/dd/yy"
            self.created = formatter.string(from: date)
        } else {
            self.created = "N/A"
        }
        
        if people.gender == "male" {
            self.gender = "Male"
        } else if people.gender == "female" {
            self.gender = "Female"
        } else {
            self.gender = "N/A"
        }
    }
    
}
