//
//  Predators.swift
//  JP Apex Predators
//
//  Created by Anup Saud on 2024-07-16.
//

import Foundation

class Predators{
    var allApexPredator:[ApexPredator] = []
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
                allApexPredator = try decoder.decode([ApexPredator].self, from: data)
                apexPredator = allApexPredator
                
            }catch{
                print("Error Decoding data:\(error)")
            }
        }
    }
    func search(for searchTerm: String) ->[ApexPredator]{
        if searchTerm.isEmpty{
            return apexPredator
        }else{
            return apexPredator.filter { predator in
                predator.name
                    .localizedCaseInsensitiveContains(searchTerm)
            }
        }
        
    }
    //Sort
    func sort(by alphabetical: Bool){
        apexPredator.sort { ApexPredator1, ApexPredator2 in
            if alphabetical{
                ApexPredator1.name < ApexPredator2.name
            }else{
                ApexPredator1.id < ApexPredator2.id
            }
            
        }
        
    }
    func filter(by type: PredatorType){
        if type == .all{
            apexPredator = allApexPredator
        }else{
            apexPredator = allApexPredator.filter { predator in
                predator.type == type
            }
        }
        
    }
}
