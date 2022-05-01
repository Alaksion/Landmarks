//
//  CircularImage.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 14/04/22.
//

import SwiftUI

struct CircularImage: View {
    let image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircularImage_Previews: PreviewProvider {
    static var landMarks = ModelData().landMarks
    static var previews: some View {
        CircularImage(image: landMarks[0].image)
    }
}
