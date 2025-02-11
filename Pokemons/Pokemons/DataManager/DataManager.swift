//
//  DataManager.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

class PokemonManager: ObservableObject {
    
    static let urlListPokemons = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0"
    static let urlDetailPokemon = "https://pokeapi.co/api/v2/pokemon/"
    
    func getPokemon(_ completion:@escaping([Pokemon]) -> ()) {
        Bundle.main.fetchData(url: PokemonManager.urlListPokemons,
                              model: PokemonPage.self) { data in
            let pokemons: [Pokemon] = data.results
            completion(pokemons)
        } failure: { error in
            print(error)
        }
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping(PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: "\(PokemonManager.urlDetailPokemon)\(id)",
                              model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
}

