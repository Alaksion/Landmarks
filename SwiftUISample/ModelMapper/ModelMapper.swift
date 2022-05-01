//
//  ModelMapper.swift
//  SwiftUISample
//
//  Created by Lucca Beurmann on 14/04/22.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landMarks: [Landmark] = JsonModelMapper().map("landmarkData.json")
}

protocol ModelMapper {
    func map<T: Decodable>(_ filename: String) -> T
}

struct JsonModelMapper: ModelMapper {
    
    func map<T>(_ filename: String) -> T where T : Decodable {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("File \(filename) could not be found")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("could not load data from \(filename)")
        }
        
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Could not parse file \(filename) to type Landmark")
        }
        
    }
    
}
