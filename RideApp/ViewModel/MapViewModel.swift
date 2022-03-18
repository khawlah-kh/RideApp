//
//  MapViewModel.swift
//  RideApp
//
//  Created by khawlah khalid on 15/03/2022.
//

import SwiftUI
import MapKit


final class MapViewModel : ObservableObject{
    
    @Published  var region : MKCoordinateRegion = .init(center: CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    
    @Published var annotations : [Location] = []
    
    
    @Published var distance : Double = 0.0
    
    var locationNumber : Int{
        annotations.count
    }
    
    let gradient = AngularGradient(gradient: Gradient(colors: [Color.red,Color.pink]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360))
    func distance (_ locations : [Location]){
        
        if let firstLocation = locations.first?.coordinate , let secondLocation = locations.last?.coordinate{
            self.distance = Double(firstLocation.distance(to: secondLocation) / 1000)
            
            
            
        }
        
    }
    
    func handelButtonTapped(){
        let newLocation = MKPointAnnotation()
        newLocation.coordinate = self.region.center
        annotations.append(Location(coordinate: newLocation.coordinate))
        
        if locationNumber == 2{
            print(distance(self.annotations))
            print(distance)
        }
        else if locationNumber > 2{
            distance = 0
            annotations.removeAll()
        }
        
    }
    
}



extension CLLocationCoordinate2D {
    
    /// Returns the distance between two coordinates in meters.
    func distance(to: CLLocationCoordinate2D) -> CLLocationDistance {
        MKMapPoint(self).distance(to: MKMapPoint(to))
    }
    
}
