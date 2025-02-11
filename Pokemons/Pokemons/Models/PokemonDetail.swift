//
//  PokemonDetail.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let stats: [PokemonStats]
    let types: [PokemonTypes]
    
    static var samplePokemonDetails = PokemonDetail(id: 0, height: 0, weight: 0, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "charzard", url: "https://pokeapi.co/api/v2/pokemon/4/"))], types: [PokemonTypes(slot: 0, type: SpecificType(name: "charzard", url: "https://pokeapi.co/api/v2/pokemon/4/"))])
    
}
