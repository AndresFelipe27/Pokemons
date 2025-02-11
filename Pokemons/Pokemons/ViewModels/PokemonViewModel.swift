//
//  PokemonViewModel.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var searchText = ""
    private let pokemonManager = PokemonManager()
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.getListPokemons()
    }
    
    func getListPokemons(){
        pokemonManager.getPokemon({ pokemons in
            DispatchQueue.main.async{
                self.pokemonList = pokemons
            }
        })
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = PokemonDetail(id: 0, height: 0, weight: 0, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "", url: ""))], types: [PokemonTypes(slot:0, type: SpecificType(name: "", url: ""))])
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let doubleValue = Double(value)
        let string = String(format: "%.2f", doubleValue / 10)
        
        return string
    }
}
