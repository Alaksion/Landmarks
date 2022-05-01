//
//  MapView.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 14/04/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinates: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                region = MKCoordinateRegion(
                    center: coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var landMarks = ModelData().landMarks
    static var previews: some View {
        MapView(coordinates: landMarks[0].locationCoordinates)
    }
}
