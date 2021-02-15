//
//  Pokemonvistamodelo.swift
//  Prueba Tecnica
//
//  Created by LMAG on 13/02/21.
//

import SwiftUI

class Pokemonvistamodelo: ObservableObject {
    @Published var pokemons = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json "
    
    init(){
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else{ return }
        
        URLSession.shared.dataTask(with: url) { (data, responsive, error) in
            guard let data = data?.parseData(removeString: "null, ") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemons = pokemon
            }
        }.resume()
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: " ")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        return data
    }
}


