//
//  SwiftUIView.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 14/04/22.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            let landMars = modelData.landMarks.filter{ landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
            
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites only")
                }
                
                ForEach(landMars) { landMark in
                    NavigationLink {
                        LocationDetailsView(location: landMark)
                    } label: {
                        LocationRow(location: landMark)
                    }
                }
                
            }.navigationTitle("Landmarks")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(ModelData())
    }
}
