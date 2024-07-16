//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Anup Saud on 2024-07-16.
//

import SwiftUI


struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    
    var filterDinos: [ApexPredator]{
        if searchText.isEmpty{
            return predators.apexPredator
        }else{
            return predators.apexPredator.filter { predator in
                predator.name
                    .localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack{
        List(filterDinos){predator in
            NavigationLink{
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                
            }label:{
                HStack{
                    //Dino Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                        .shadow(color:.white, radius: 2)
                    
                    
                    VStack(alignment: .leading){
                        //Name
                        Text(predator.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        //Type
                        Text(predator.type.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal,13)
                            .padding(.vertical,5)
                        //                        .background{
                        //                            if predator.type == "land"{
                        //                                Color.green.opacity(0.3)
                        //
                        //                            } else if predator.type == "air"{
                        //                                Color.blue.opacity(0.3)
                        //                            }else if predator.type == "sea"{
                        //                                Color.teal.opacity(0.3)
                        //                            }
                        //
                        //                        }.clipShape(RoundedRectangle(cornerRadius: 25))
                            .background(predator.type.background)
                            .clipShape(.capsule)
                    }
                }
            }
            
            
        }
        .navigationTitle("Apex Predators")
        .searchable(text: $searchText)
        .autocorrectionDisabled()
        .animation(.default, value: searchText)
                
                
    }.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    ContentView()
}
