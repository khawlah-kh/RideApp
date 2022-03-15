//
//  Location.swift
//  RideApp
//
//  Created by khawlah khalid on 14/03/2022.
//

import SwiftUI
import CoreLocation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}
