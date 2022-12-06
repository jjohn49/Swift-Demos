//
//  EnviormentVariables.swift
//  Swift-Demos
//
//  Created by John Johnston on 12/5/22.
//

import Foundation

class MyPets: ObservableObject{
    @Published var allPets: [Pet] = []
    @Published var myFavoritePet: Pet? = nil
    @Published var wasModified: Bool = false
}

struct Pet: Identifiable{
    let id = UUID()
    let name: String
    let species: String
}
