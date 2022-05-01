//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 13/04/22.
//

import SwiftUI

struct LocationDetailsView: View {
    @EnvironmentObject var data: ModelData
    
    var landMardIndex: Int {
        data.landMarks.firstIndex(where: {landMark in
            landMark.id == location.id
        })!
    }
    
    let location: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinates: location.locationCoordinates)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircularImage(image: location.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title)
                    .padding(.bottom, 5)
                HStack {
                    Text(location.park)
                    Spacer()
                    Text(location.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                HStack {
                    Text("About \(location.name)")
                        .font(.title2)
                        .padding(.bottom, 5)
                    Spacer()
                    FavoriteButton(isSet: $data.landMarks[landMardIndex].isFavorite)
                }
                Text(location.description)
            }.padding()
            Spacer()
        }
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var landMarks = ModelData().landMarks
    
    static var previews: some View {
        LocationDetailsView(location: landMarks[0]).environmentObject(ModelData())
    }
}
