//
//  Pokemon.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "charmander",
                                       url: "https://pokeapi.co/api/v2/pokemon/4/")
}
