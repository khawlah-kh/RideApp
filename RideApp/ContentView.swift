//
//  ContentView.swift
//  RideApp
//
//  Created by khawlah khalid on 14/03/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @State var region : MKCoordinateRegion = .init(center: CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var annotations : [City] = [City(name: "Riyadh", coordinate: CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586))]

    var body: some View {
        VStack{
            ZStack{
                Map(coordinateRegion: $region, annotationItems: annotations) {
                           MapMarker(coordinate: $0.coordinate)
                       }
                    .ignoresSafeArea()

            
                Circle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: 30, height: 30)
                
            }
          
            
            Button {
                
            } label: {
                
                Image(systemName: "plus")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.top,-35)
            }
            //.padding()
            Text("Distance Evaluation")
                .font(.title)
                .bold()
                .padding()
           // ZStack{
            Circle()
                .stroke(Color.red.opacity(0.4),lineWidth: 20)
                .frame(width: 300, height: 300)
                .padding()
           // }
            HStack{
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "gear")
                        .font(.title)
                        .padding()
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
