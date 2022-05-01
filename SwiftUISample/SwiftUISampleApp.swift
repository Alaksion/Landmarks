//
//  SwiftUISampleApp.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 13/04/22.
//

import SwiftUI

@main
struct SwiftUISampleApp: App {
    @StateObject private var data = ModelData()
    
    var body: some Scene {
        WindowGroup {
            LocationListView()
                .environmentObject(data)
        }
    }
}
