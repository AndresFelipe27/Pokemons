//
//  PokemonStats.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

struct PokemonStats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: SpecificStat
}
