//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Anup Saud on 2024-07-16.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                ZStack(alignment: .bottomTrailing){
                    //background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    //dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5,height: geo.size.height/3)
                        .scaleEffect(x: -1)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 7)
                        .offset(y:20)
                }
                VStack(alignment:.leading){
                    //dino name
                    Text(predator.name)
                        .font(.largeTitle)

                    
                    //Current Location
                    
                    //Appears in
                    Text("Appears In: ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    ForEach(predator.movies, id: \.self){ movie in
                        Text("• " + movie)
                            .font(.subheadline)
                        
                        
                    }
                    
                    // Movie moments
                    Text("Movie Moments")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.top,15)
                    
                    ForEach(predator.movieScenes){scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical,1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom,15)
                    }
                    //Link to more details
                    Text("Read More: ")
                        .font(.caption)
                    
                    Link(predator.link,destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredator[10])
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
