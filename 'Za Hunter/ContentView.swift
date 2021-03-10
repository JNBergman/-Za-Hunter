//
//  ContentView.swift
//  'Za Hunter
//
//  Created by Student on 3/8/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var locationManager = CLLocationManager()
    @State private var userTrackingModule: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.15704,
            longitude: -88.14812),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05))
}
@State private var places = [Place]()
var body: some View {
    Map
    coordinateRegion: $region,
    interactionModes: .all
    showsUserLocation: True,
    UserTrackingMode: $userTrackingMode,
    annotationItems: places) { place in
        MapAnnotation(coordinate: place.annotation.coordinate) {
            Marker(mapItem: place.mapItem)
        }
        
        
    }
    func performSearch(item: String) {
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        places.append(Place(annotation: annotation, mapItem: mapItem))
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct Place: Indetifiable {
        let id = UUID()
        let annotation: MKPointAnnotation
        let mapItem: MKMapItem
    }
    
    struct Marker: View {
        var mapItem: MKMapItem
        var body: some View {
            if let url = mapItem.url {
                Link(destination: url, label: {
                    Image("pizza")
                })
                
            }
        }
    }
}
