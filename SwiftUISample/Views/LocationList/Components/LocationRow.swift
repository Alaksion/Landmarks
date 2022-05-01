//
//  LocationRow.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 14/04/22.
//

import SwiftUI

struct LocationRow: View {
    var location: Landmark
    
    var body: some View {
        HStack {
            location.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(location.name)
            Spacer()
            if location.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }.padding(.vertical, 5)
    }
}

struct LocationRow_Previews: PreviewProvider {
    static var landMarks = ModelData().landMarks
    static var previews: some View {
        Group {
            LocationRow(location: landMarks[0])
            LocationRow(location: landMarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
