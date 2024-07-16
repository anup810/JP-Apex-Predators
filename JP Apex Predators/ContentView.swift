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
    @State var alphabetical: Bool = false
    @State var currentSelection = PredatorType.all
    
    var filterDinos: [ApexPredator]{
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        
       return predators.search(for: searchText)

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
                        .shadow(color:.white, radius: 1)
                    
                    
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
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button{
                    withAnimation{
                        alphabetical.toggle()
                    }
                }label: {
                    Image(systemName: alphabetical ? "film" : "textformat")
                        .symbolEffect(.bounce, value: alphabetical)
//                    if alphabetical{
//                        Image(systemName: "film")
//                    }else{
//                        Image(systemName: "textformat")
//                    }
                    
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Menu{
                    Picker("Filter",selection: $currentSelection.animation()){
                        ForEach(PredatorType.allCases){
                            type in
                            Label(type.rawValue.capitalized,systemImage: type.icon)
                        }
                    }
                    
                }label: {
                    Image(systemName: "slider.horizontal.3")
                }
            }
        }

                
                
    }.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    ContentView()
}
