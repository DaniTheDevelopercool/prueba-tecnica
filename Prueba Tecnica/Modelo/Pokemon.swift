//
//  Pokemon.swift
//  Prueba Tecnica
//
//  Created by LMAG on 13/02/21.
//

import Foundation

struct Pokemon: Decodable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "Bulbasaur", type: "poison"),
    .init(id: 1, name: "Ivysaur", imageUrl: "Bulbasaur", type: "poison"),
    .init(id: 2, name: "Venusaur", imageUrl: "Bulbasaur", type: "poison"),
    .init(id: 3, name: "Charmander", imageUrl: "Bulbasaur", type: "fire"),
    .init(id: 4, name: "Charmelon", imageUrl: "Bulbasaur", type: "fire"),
    .init(id: 5, name: "Charizard", imageUrl: "Bulbasaur", type: "fire"),

    
]
