//
//  Predators.swift
//  JP Apex Predators
//
//  Created by Anup Saud on 2024-07-16.
//

import Foundation

class Predators{
    var apexPredator:[ApexPredator] = []
    init(){
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredator = try decoder.decode([ApexPredator].self, from: data)
                
            }catch{
                print("Error Decoding data:\(error)")
            }
        }
    }
}
