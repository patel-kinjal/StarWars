//
//  Service.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    
//    func fetchData() {
//
//        let url = URL(string: "https://swapi.co/api/people")!
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//
//            if error != nil || data == nil {
//                print("Client error!")
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                print("Server error!")
//                return
//            }
//
//            guard let mime = response.mimeType, mime == "application/json" else {
//                print("Wrong MIME type!")
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print(json)
//            } catch {
//                print("JSON error: \(error.localizedDescription)")
//            }
//        }
//
//        task.resume()
//    }
    
    
    
    func fetchPeople(completion: @escaping (StarWarsPeopleModel?, Error?) -> ()) {
        
        let urlString = "https://swapi.co/api/people"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode(StarWarsPeopleModel.self, from: data)
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
