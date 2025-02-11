//
//  PokemonPage.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

struct PokemonPage : Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

